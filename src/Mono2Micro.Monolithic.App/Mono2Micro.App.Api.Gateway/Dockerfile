#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["Mono2Micro.App.Api.Gateway/Mono2Micro.App.Api.Gateway.csproj", "Mono2Micro.App.Api.Gateway/"]
RUN dotnet restore "Mono2Micro.App.Api.Gateway/Mono2Micro.App.Api.Gateway.csproj"
COPY . .
WORKDIR "/src/Mono2Micro.App.Api.Gateway"
RUN dotnet build "Mono2Micro.App.Api.Gateway.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Mono2Micro.App.Api.Gateway.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Mono2Micro.App.Api.Gateway.dll"]