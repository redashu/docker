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

## So every single thing in container is maintained by namespaces and that is the concept of Kernel 

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

### to check ALl possible namespaces In any linux see this 

```
root@XIA:/proc/1/ns# cd  /proc/1/ns/
root@XIA:/proc/1/ns# ls
cgroup  ipc  mnt  net  pid  pid_for_children  time  time_for_children  user  uts

```




