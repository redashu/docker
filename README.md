# dockerfile
## ARG in dockerfile 
This variable will only be available during image build not after that 
## you can replace this variable variable value 
```
[root@root]$ docker build -t test:v2 --build-arg var1=ftp .
```

## ENV in dockerfile 
this variable can be used during image build time and also availabe in container  <br/>
you can replace env during container run time after successful build
```
 docker run --rm -e env_var=ashutoshh test:v6
```

## Building image from a particular branch 

```
[root@ip-172-31-15-194 ok]# docker build -t x1 https://github.com/redashu/docker.git#dockerfile
Sending build context to Docker daemon  79.87kB
Step 1/3 : FROM fedora
latest: Pulling from library/fedora
ae7b613df528: Pull complete 
Digest: sha256:aa889c59fc048b597dcfab40898ee3fcaad9ed61caf12bcfef44493ee670e9df
Status: Downloaded newer image for fedora:latest
 ---> b3048463dcef
Step 2/3 : ARG  var1=mysql
 ---> Running in 0c127c047ed7
Removing intermediate container 0c127c047ed7

```

# important tag for building image 

[docker docs] ('https://docs.docker.com/engine/reference/commandline/build/')


# Google Distroless 

## Reusing image after building packages from some other images 
## Incase of multi stage build 

[Google Distroless](https://github.com/GoogleContainerTools/distroless)
