# Docker -: The Next Generation platform service 
##  Info about Docker
The most amazing software based platform service ever <br/>
used by most companies <br/>
docker is free for everyone  <br/>

## Developement  info 
<ul>
	<li> Solomon Hykes is the core developer  </li>
	<li> Docker Inc is the company  </li>
	<li> written in Go lang  </li>
	
</ul>

## Public release 
docker released in December 21, 2013  <br/>

## Platform supported 
<ol>
	<li> Linux  kernel 3.10 and later </li>
	<li> Mac Os </li>
	<li> Windows server 2016 and later  </li>
</ol>

## TO install Docker using Docker Desktop 
[video](https://www.youtube.com/watch?v=LLXNjtrd4Zk&list=PLB2NsH6aVTpbH-a0Z96k-cc6XGEycdmNH)

## study and software details 
For offical website you can browse [docker docs](https://docs.docker.com/)  <br/>
For docker images you can browser  [docker hub](https://about.gitlab.com/) <br/> 

##  Bash Completion for Docker
you can download it from 
```
sudo curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker.sh
```

# NameSpace  Concept in containers

## We know that each container are having 

1. File System 
2.  Process 
3.  Memories  

### and many other information and that is shared by  Host Kernel so how Contianer and Host things are not getting conflict 

###  So every single thing in a container is maintained by namespaces , And Namespace  is the concept of Kernel 

# Linux Namespaces 

###  Mainly there are 6 type of namespaces are there 

<ol>
	<li> Mount (mnt) </li>
	<li> Process ID (pid)  </li>
	<li> Network (net) </li>
	<li> Interprocess Communication (ipc) </li>
	<li> UTS (UNIX Time-Sharing)  </li>
	<li> User ID (user)  </li>
	

</ol>


## Note: Apart from Above namespaces there are few more 

1.  Control group (cgroup) Namespace
2.  Time Namespace

## Link for reading purpose 

[Wiki](https://en.wikipedia.org/wiki/Linux_namespaces)

[Opensource](https://opensource.com/article/19/10/namespaces-and-containers-linux)

### to check ALl possible namespaces In any existing linux based OS process 

```
root@XIA:/proc/1/ns# cd  /proc/1/ns/
root@XIA:/proc/1/ns# ls
cgroup  ipc  mnt  net  pid  pid_for_children  time  time_for_children  user  uts

```


## List of Namespaces in any linux Machine 

```
lsns 

===

root@XIA:/proc/1/ns# lsns   |   cut -d" " -f2  |  uniq

cgroup
pid
user
uts
ipc
mnt
net
mnt
uts
mnt
uts
mnt

```

##  There are few commands you can use 

1. lsns --- List of all namespaces in Linux Based host
2. unshare  -- to create a new namespace 
3. nsenter  -- to enter into existing namespace , also you can run some program in existing namespace 


## Creating  Namespaces with some process 

###  Starting a shell in new UTS and Network namespaces 

```
root@XIA:~# unshare  --uts --net  /bin/sh 
# ip a 
1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
# hostname
XIA
# hostname C1	
# hostname
C1
# exit


root@XIA:~# hostname
XIA

```

### In above command you can see clearily that SHELL is having its own UTS and Network Namespace s
### So even if we are chaning the hostname it is not effecting the Hostname of Main Host 


## starting a Sleep command in 4 namespaces only 

```
root@XIA:~# unshare --ipc --uts --net --mount sleep 200 &
[1] 273452
root@XIA:~# 

```

### Checking namespace only for Particular PiD 

```

root@XIA:~# lsns  -p  273452 
        NS TYPE   NPROCS    PID USER COMMAND
4026531835 cgroup    383      1 root /sbin/init splash
4026531836 pid       346      1 root /sbin/init splash
4026531837 user      339      1 root /sbin/init splash
4026532771 mnt         1 273452 root sleep 200
4026532773 uts         1 273452 root sleep 200
4026532774 ipc         1 273452 root sleep 200
4026532776 net         1 273452 root sleep 200

```

### Using normal linux command you can check namespaces also 

```
root@XIA:~# ls  -l  /proc/273452/ns  
total 0
lrwxrwxrwx 1 root root 0 Jun  8 12:13 cgroup -> 'cgroup:[4026531835]'
lrwxrwxrwx 1 root root 0 Jun  8 12:13 ipc -> 'ipc:[4026532774]'
lrwxrwxrwx 1 root root 0 Jun  8 12:13 mnt -> 'mnt:[4026532771]'
lrwxrwxrwx 1 root root 0 Jun  8 12:13 net -> 'net:[4026532776]'
lrwxrwxrwx 1 root root 0 Jun  8 12:13 pid -> 'pid:[4026531836]'
lrwxrwxrwx 1 root root 0 Jun  8 12:15 pid_for_children -> 'pid:[4026531836]'
lrwxrwxrwx 1 root root 0 Jun  8 12:15 time -> 'time:[4026531834]'
lrwxrwxrwx 1 root root 0 Jun  8 12:15 time_for_children -> 'time:[4026531834]'
lrwxrwxrwx 1 root root 0 Jun  8 12:13 user -> 'user:[4026531837]'
lrwxrwxrwx 1 root root 0 Jun  8 12:13 uts -> 'uts:[4026532773]'

```

## Namespace Game Ball

### create a container 

```
root@XIA:~# docker run -itd  --name x1 alpine ping fb.com 
78018ce103a31ded716d0ff451375dfd32ed32ff6992bc59a9eb7bbee89357f5
root@XIA:~# 
root@XIA:~# docker ps
CONTAINER ID   IMAGE          COMMAND            CREATED         STATUS         PORTS     NAMES
78018ce103a3   alpine         "ping fb.com"      6 seconds ago   Up 5 seconds             x1

```

### Now checking container PID 

```
root@XIA:~# docker  inspect   x1   --format='{{.State.Pid}}'
285189

```

### Entering into Network namespace of  COntainer RUning 

```
root@XIA:~# nsenter   -t  285189 --net  ifconfig 
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.3  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:ac:11:00:03  txqueuelen 0  (Ethernet)
        RX packets 159  bytes 17562 (17.5 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 120  bytes 11304 (11.3 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

```

### above command is same as THis 

```
root@XIA:~# docker exec  x1 ifconfig  
eth0      Link encap:Ethernet  HWaddr 02:42:AC:11:00:03  
          inet addr:172.17.0.3  Bcast:172.17.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:230 errors:0 dropped:0 overruns:0 frame:0
          TX packets:185 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:24963 (24.3 KiB)  TX bytes:17562 (17.1 KiB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
```


## So inshort what is happening is -- docker client is just interacting with specific and may be all namespaces in the backend 

## access Exactly container 

```
root@XIA:~# nsenter   -t  285189  --uts --mount   sh
/ # ls
bin    dev    etc    home   lib    media  mnt    opt    proc   root   run    sbin   srv    sys    tmp    usr    var
/ # hostname
78018ce103a3
/ # cat /etc/os-release 
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.13.5
PRETTY_NAME="Alpine Linux v3.13"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
/ # 
root@XIA:~# nsenter   -t  285189   --mount   sh
/ # 
root@XIA:~# nsenter   -t  285189  --uts   sh
# hostname
78018ce103a3
# 
# 

```
### One More amazing Demo 

```
root@XIA:~# nsenter   -t  285189 --net  --uts --mount  ps 
PID   USER     TIME  COMMAND
    1 root      0:00 ping fb.com
root@XIA:~# 
root@XIA:~# alias  docker1='nsenter   -t  285189 --net  --uts --mount '
root@XIA:~# 
root@XIA:~# docker1 ps
PID   USER     TIME  COMMAND
    1 root      0:00 ping fb.com

```




