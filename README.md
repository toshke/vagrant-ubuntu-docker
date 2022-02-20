# Docker in Vagrant Ubuntu VM

### Prereqs:

- `virtualbox`
- `virtualbox-extension-pack` 
- `vagrant` 
- `vagrant-vbguest` 

### Run

`make provision` 

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

## Folder share

By default, docker mounts will work within `$HOME/workspace` folder,
but feel free to adjust this to your needs. 

Use `vagrant reload` to apply new configuration - beware this will
reboot your VM with all the containers running on it

## Port forwaring

If you mount any ports on docker host to container, you can reach them
from actual VM host by editiling line `#14` ports array. 

Use `vagrant reload` to apply new configuration - beware this will
reboot your VM with all the containers running on it