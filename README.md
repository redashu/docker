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


## History of using format command in docker 

```
8771  docker inspect -f '{{.NetworkSettings.IPAddress}}' web1
 8772  docker inspect -f '{{.NetworkSettings.Networks.IPAddress}}' web1
 8773  docker inspect -f '{{.NetworkSettings.IPAddress}}' web1
 8774  docker inspect -f '{{.NetworkSettings.GateWay}}' web1
 8775  docker inspect -f '{{.NetworkSettings.Gateway}}' web1
 8776  docker inspect -f '{{.State.Status}}' web1
 8777  docker inspect -f '{{.Id}}' web1
 8778  docker inspect -f '{{.Image}}' web1
 8779  docker inspect -f '{{.ResolvConfPath}}' web1
 8780* docker inspect -f  '{{.HostConfig}}'
 8781* docker inspect -f  '{{.HostConfig}}'  web1
 8782* docker inspect -f  '{{.HostConfig.Binds}}'  web1
 8783* docker inspect -f  '{{.HostConfig.Binds}}{{end}}'  web1
 8784* docker inspect -f  '{{.HostConfig.Binds}}[0]'  web1
 8785* docker inspect -f  '{{.HostConfig.Binds}}'  web1
 8786* docker inspect -f  '{{.RestartPolicy.Name}}'  web1
 8787* docker inspect -f  '{{.HostConfig.RestartPolicy}}'  web1
 8788* docker inspect -f  '{{.HostConfig.RestartPolicy.Name}}'  web1
 8789* docker inspect -f  '{{.HostConfig.MaskedPaths}}'  web1
 8790* docker inspect -f  '{{.Config}}'  web1
 8791* docker inspect -f  '{{.Config.Hostname}}'  web1
 8792  docker inspect  nginx 
 8793* docker inspect -f  '{{.ContainerConfig.cmd}}' nginx 
 8794* docker inspect -f  '{{.ContainerConfig.Cmd}}' nginx 

```

