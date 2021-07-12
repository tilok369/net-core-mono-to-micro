FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["src/ASAI.STS.Identity/ASAI.STS.Identity.csproj", "src/ASAI.STS.Identity/"]
COPY ["src/ASAI.Admin.EntityFramework.Shared/ASAI.Admin.EntityFramework.Shared.csproj", "src/ASAI.Admin.EntityFramework.Shared/"]
COPY ["src/ASAI.Shared/ASAI.Shared.csproj", "src/ASAI.Shared/"]
RUN dotnet restore "src/ASAI.STS.Identity/ASAI.STS.Identity.csproj"
COPY . .
WORKDIR "/src/src/ASAI.STS.Identity"
RUN dotnet build "ASAI.STS.Identity.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ASAI.STS.Identity.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_FORWARDEDHEADERS_ENABLED=true
ENTRYPOINT ["dotnet", "ASAI.STS.Identity.dll"]