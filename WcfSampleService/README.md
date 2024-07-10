# DOCKER BUILD COMMAND 

```console
docker build -f .\WcfSampleService\Dockerfile --force-rm -t wcfsampleservice:dev .
```

# DOCKER RUN COMMAND 

```console
docker run --name wcfsampleservice --rm -it -p 5000:80 wcfsampleservice:dev
```

You should see the following console output as the application starts.

```console
C:\git\dotnet-framework-docker\samples\aspnetapp>docker run --name aspnet_sample --rm -it -p 8000:80 aspnetapp
Service 'w3svc' has been stopped

Service 'w3svc' started
```

After the application starts, navigate to `http://localhost:8000` in your web browser. You need to navigate to the application via IP address instead of `localhost` for earlier Windows versions, which is demonstrated in [View the ASP.NET app in a running container on Windows](https://github.com/microsoft/dotnet-framework-docker/blob/main/samples/aspnetapp/README.md#view-the-aspnet-app-in-a-running-container-on-windows).


Note: The `-p` argument maps port 8000 on your local machine to port 80 in the container (the form of the port mapping is `host:container`). See the [Docker run reference](https://docs.docker.com/engine/reference/commandline/run/) for more information on commandline parameters.

# Reference

This [sample](Dockerfile) demonstrates how to use ASP.NET and Docker together.

The sample builds the application in a container based on the larger [.NET Framework SDK Docker image](https://hub.docker.com/_/microsoft-dotnet-framework-sdk/). It builds the application and then copies the final build result into a Docker image based on the smaller [ASP.NET Runtime Docker image](https://hub.docker.com/_/microsoft-dotnet-framework-aspnet/). It uses Docker [multi-stage build](https://github.com/dotnet/announcements/issues/18) and [multi-arch tags](https://github.com/dotnet/announcements/issues/14).

This sample requires the [Docker client](https://store.docker.com/editions/community/docker-ce-desktop-windows).

### View the ASP.NET app in a running container on Windows

After the application starts, navigate to the container IP (as opposed to http://localhost:5000/) in your web browser with the the following instructions:

1. Open up another command prompt.
1. Run `docker exec aspnet_sample ipconfig`.
1. Copy the container IP address and paste into your browser (for example, `172.29.245.43`).

See the following example of how to get the IP address of a running Windows container.

```console
C:\git\dotnet-framework-docker\samples\aspnetapp>docker exec aspnet_sample ipconfig

Windows IP Configuration


Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : contoso.com
   Link-local IPv6 Address . . . . . : fe80::1967:6598:124:cfa3%4
   IPv4 Address. . . . . . . . . . . : 172.29.245.43
   Subnet Mask . . . . . . . . . . . : 255.255.240.0
   Default Gateway . . . . . . . . . : 172.29.240.1
```

Note: [`docker exec`](https://docs.docker.com/engine/reference/commandline/exec/) supports identifying containers with name or hash. The container name is used in the preceding instructions. `docker exec` runs a new command (as opposed to the [entrypoint](https://docs.docker.com/engine/reference/builder/#entrypoint)) in a running container.

Some people prefer using `docker inspect` for this same purpose, as demonstrated in the following example.

```console
C:\git\dotnet-framework-docker\samples\aspnetapp>docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" aspnetcore_sample
172.25.157.148
```

## Deploying to Production vs Development

The approach for running containers differs between development and production. 

In production, you will typically start your container with `docker run -d`. This argument starts the container as a service, without any console interaction. You then interact with it through other Docker commands or APIs exposed by the containerized application.

In development, you will typically start containers with `docker run --rm -it`. These arguments enable you to see a console (important when there are errors), terminate the container with `CTRL-C` and cleans up all container resources when the container is termiantes. You also typically don't mind blocking the console. This approach is demonstrated in prior examples in this document.

We recommend that you do not use `--rm` in production. It cleans up container resources, preventing you from collecting logs that may have been captured in a container that has either stopped or crashed.
