#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app
# copy csproj and restore as distinct layers
COPY *.sln .
COPY WcfSampleService/*.csproj WcfSampleService/
COPY WcfSampleService/*.config WcfSampleService/
RUN nuget restore

# copy everything else and build app
COPY WcfSampleService/ WcfSampleService/
WORKDIR /app/WcfSampleService
RUN msbuild /p:OutDir=./publish/ /p:Configuration=Release  -r:False

FROM mcr.microsoft.com/dotnet/framework/wcf:4.8 AS runtime
ARG source
WORKDIR /inetpub/wwwroot
COPY --from=build /app/WcfSampleService/publish/_PublishedWebsites/wcfsampleservice/. ./
