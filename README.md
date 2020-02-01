# Network DevOps Container

This container aims to have everything needed to begin automating your network. Since this container will never be a true microservice, but rather an environment to perform your automation / troubleshooting, I have selected Centos as the base image. While this ultimately makes the container much larger, it has everything that I need to do my job (ie. SSH, traceroute, ping, and yum for anything missed).

`image: centos/python-36-centos7:latest`

## Operations

How to use this container

### Pull from Dockerhub

`docker pull packetferret/dalmasca:latest`

### Building the container

`make build`

### Run the container

`make run`

Running this container will mount the current directory from your local computer into the container, run `ls -l` inside the container to confirm your files are there

If your files are in another directory, then run the following command in that directory instead.

`docker run -it -v $(pwd):/home/tmp/files -w /home/tmp/files packetferret/dalmasca:0.0.1 /usr/bin/zsh`

## Packages installed

This is an incomplete list of packages you may find interesting

- ansible
- aos-pyez (Apstra)
- f5-sdk (F5)
- jsnapy (Juniper pre/post checks tool)
- junos-eznc (Juniper PyEZ)
- jxmlease (Juniper XML)
- napalm
- netmiko
- nxapi-plumbing
- pyeapi (Arista EOS)
- pyIOSXR (Cisco IOS-XR)
- textfsm
