# Network DevOps Container

This container aims to have everything needed to begin automating your network.

`image: centos/python-36-centos7:latest`

## Operations

How to use this container

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
