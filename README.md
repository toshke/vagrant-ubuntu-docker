# Docker in Vagrant Ubuntu VM

### Prereqs:

- `virtualbox`
- `virtualbox-extension-pack` 
- `vagrant` 
- `vagrant-vbguest` 

### Run

- Clone the repo 

```
git clone https://github.com/toshke/vagrant-ubuntu-docker.git && cd vagrant-ubuntu-docker
```

- To create and run the VM

`make provision` 

- TO connect to Docker from the host

`eval $(make env)`


## Why?

Docker desktop application for MacOS seems to be taking
2 full cores on my mac, all of the time. It's not `hyperkit` 
issues it's actual `Docker` app that is having 100% cpu 
usage

## Alternatives

Running docker via `minikube` as suggested by this [post](https://dhwaneetbhatt.com/blog/run-docker-without-docker-desktop-on-macos) yielded veeery poor 
disk perfromance for myself. E.g. running `du -h -d1` within 
average `node_modules` folders took > 10 secs. On `VMBox/Ubuntu` mounted
option, this works with sub-second performance. 

While aforemntioned post suggests against 3 layer drive mapping,
this works just fine for myself, and in competition of 
3 (Docker 4 desktop, Minikube, Vagrant provisioned VM) works the best. 

## Potential issues

VBox may complain if `192.168.56.2` ip is already reserved
by another network iface on your computer. Just edit [Vagrantfile#4](https://github.com/toshke/vagrant-ubuntu-docker/blob/main/Vagrantfile#L4) to apply available IP

## Folder share

By default, docker mounts will work within `$HOME/workspace` folder,
but feel free to adjust this to your needs. 

Use `vagrant reload` to apply new configuration - beware this will
reboot your VM with all the containers running on it

## Port forwaring

If you mount any ports on docker host to container, you can reach them
from actual VM host by editiling [Vagrant file line#14] (https://github.com/toshke/vagrant-ubuntu-docker/blob/main/Vagrantfile#L14) ports array. 

Use `vagrant reload` to apply new configuration - beware this will
reboot your VM with all the containers running on it