FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["src/ASAI.Admin.Api/ASAI.Admin.Api.csproj", "src/ASAI.Admin.Api/"]
COPY ["src/ASAI.Admin.EntityFramework.Shared/ASAI.Admin.EntityFramework.Shared.csproj", "src/ASAI.Admin.EntityFramework.Shared/"]
COPY ["src/ASAI.Admin.EntityFramework.SqlServer/ASAI.Admin.EntityFramework.SqlServer.csproj", "src/ASAI.Admin.EntityFramework.SqlServer/"]
COPY ["src/ASAI.Admin.EntityFramework.PostgreSQL/ASAI.Admin.EntityFramework.PostgreSQL.csproj", "src/ASAI.Admin.EntityFramework.PostgreSQL/"]
COPY ["src/ASAI.Shared/ASAI.Shared.csproj", "src/ASAI.Shared/"]
COPY ["src/ASAI.Admin.EntityFramework.MySql/ASAI.Admin.EntityFramework.MySql.csproj", "src/ASAI.Admin.EntityFramework.MySql/"]
RUN dotnet restore "src/ASAI.Admin.Api/ASAI.Admin.Api.csproj"
COPY . .
WORKDIR "/src/src/ASAI.Admin.Api"
RUN dotnet build "ASAI.Admin.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ASAI.Admin.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_FORWARDEDHEADERS_ENABLED=true
ENTRYPOINT ["dotnet", "ASAI.Admin.Api.dll"]