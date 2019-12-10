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
