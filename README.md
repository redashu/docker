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


# Container security issues 

## How to solve 

```
docker run --detach-keys="ctrl-p" -it -v /:/mnt/rootdir --name testing busybox

chroot /mnt/rootdir

```

## how to solve 

```

docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh

```

