# dockerfile
## ARG in dockerfile 
This variable will only be available during image build not after that 
## you can replace this variable variable value 
```
[root@root]$ docker build -t test:v2 --build-arg var1=ftp .
```

