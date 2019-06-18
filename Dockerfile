FROM centos/python-36-centos7:latest

### -------------------------------------------------
### Metadata information
### -------------------------------------------------
LABEL name="dalmasca"
LABEL maintainer="packetferret@gmail.com"
LABEL description="network devops container"
LABEL license="GPLv2"
LABEL url="https://github.com/packetferret/dalmasca"
LABEL build-date="20190618"

### -------------------------------------------------
### Install system Package
### -------------------------------------------------
USER root
RUN yum -y update 
RUN yum -y install vim nmap wget telnet zsh
RUN yum clean all
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN rm -rf /tmp/* /var/tmp/*

### -------------------------------------------------
### Change directory to /home/tmp
### -------------------------------------------------
WORKDIR /home/tmp/files

### -------------------------------------------------
### Add and install python packages
### -------------------------------------------------
ADD files/requirements.txt requirements.txt
RUN pip install -r requirements.txt

### -------------------------------------------------
### Copy local files to container
### -------------------------------------------------
COPY files/jsnapy.cfg /etc/jsnapy/jsnapy.cfg
COPY files/.zshrc /opt/app-root/src/.zshrc
COPY files/ansible.cfg /opt/app-root/src/.ansible/ansible.cfg
COPY files/dracula.zsh-theme /opt/app-root/src/.oh-my-zsh/themes/dracula.zsh-theme

### -------------------------------------------------
### Install Ansible Galaxy roles
### -------------------------------------------------
RUN ansible-galaxy install ansible-network.network-engine
RUN ansible-galaxy install ansible-network.juniper_junos

### -------------------------------------------------
### Environmentals
### -------------------------------------------------
ENV HAPPY True
ENV SHELL /usr/bin/zsh
ENV ANSIBLE_CONFIG /opt/app-root/src/.ansible/ansible.cfg
