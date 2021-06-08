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





