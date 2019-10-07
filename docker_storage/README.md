# Docker -: The Next Generation platform service 
##  Info about Docker
The most amazing software based platform service ever <br/>
used by most companies <br/>
docker is free for everyone  <br/>

## Docker Storage 
Writing data persistently in container and using it further is a big deal if you are using containers  <br/>
another thing is if you remove container then it will remove that data associated with <br/>


## Docker Storage Drivers 
<ul>
 <li> Overlay2 & Overlay  </li>
 <li> AUFS   </li>
 <li> DeviceMapper  </li>
 <li> vfs , zfs, btrfs   </li>
</ul>

## checking default Storage driver 
```
root@fire:~# docker info  |   grep -i storage
 Storage Driver: overlay2
```

## checking supported storage driver

```
root@fire:~# grep -i overlay  /proc/filesystems 
nodev	overlay
root@fire:~# 
root@fire:~# grep -i aufs  /proc/filesystems 
nodev	aufs

```

## Changing  storage driver 

<b> Every storage driver have its own storage management and layer system </b>  <br/>
<i> so in case you have changed storage driver it you can not access existing images or containers </i>

<h4> checking the existing driver  </h4>

```
[root@fire ~]# docker info   |  grep -i storage
Storage Driver: overlay2

```

<h3> checking images  </h3>

```
[root@station233 ~]# docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
docker.io/wordpress     latest              936a00d29583        10 days ago         542 MB
docker.io/nginx         latest              f949e7d76d63        12 days ago         126 MB
docker.io/mariadb       latest              92495405fc36        2 weeks ago         356 MB
docker.io/mysql         latest              b8fd9553f1f0        3 weeks ago         445 MB

```

<b> changing storage driver in Ubuntu based system  </b>

```
 cat  /etc/docker/daemon.json 
{
  "storage-driver": "overlay2",
  "data-root" :  "/mnt/go"
}

```
<h2>  changing driver in Redhat based system  </h2>
