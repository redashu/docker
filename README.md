# Windows Containers 

## browse Windows repo 

[microsoft repo] ('https://hub.docker.com/_/microsoft-powershell')

## More links 

[new microsoft link] ('https://hub.docker.com/_/microsoft-windows-servercore?tab=description')

## Few commands 

```
PS C:\Users\Administrator> docker images
REPOSITORY                             TAG                 IMAGE ID            CREATED             SIZE
mcr.microsoft.com/dotnet/nightly/sdk   latest              fdbba07c2462        3 days ago          821MB
mcr.microsoft.com/windows/servercore   ltsc2019            71d3f266f3af        5 weeks ago         5.1GB
mcr.microsoft.com/powershell           latest              70c907680c3c        2 months ago        5.3GB
```

## Php IIS hosting 

```
docker run --name nanoiis -d -it -p 80:80 nanoserver/iis-php

```

### Phpinfo 

[COol] ('https://hub.docker.com/r/nanoserver/iis-php')

## Sample Docker project 

[dotnet core] ('https://github.com/dotnet/dotnet-docker/blob/master/samples/dotnetapp/README.md')

## sample hosting 

```
docker run --rm -it -p 8000:80 mcr.microsoft.com/dotnet/samples:aspnetapp

```


