FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["src/ASAI.Admin/ASAI.Admin.csproj", "src/ASAI.Admin/"]
COPY ["src/ASAI.Admin.EntityFramework.Shared/ASAI.Admin.EntityFramework.Shared.csproj", "src/ASAI.Admin.EntityFramework.Shared/"]
COPY ["src/ASAI.Admin.EntityFramework.SqlServer/ASAI.Admin.EntityFramework.SqlServer.csproj", "src/ASAI.Admin.EntityFramework.SqlServer/"]
COPY ["src/ASAI.Admin.EntityFramework.PostgreSQL/ASAI.Admin.EntityFramework.PostgreSQL.csproj", "src/ASAI.Admin.EntityFramework.PostgreSQL/"]
COPY ["src/ASAI.Shared/ASAI.Shared.csproj", "src/ASAI.Shared/"]
COPY ["src/ASAI.Admin.EntityFramework.MySql/ASAI.Admin.EntityFramework.MySql.csproj", "src/ASAI.Admin.EntityFramework.MySql/"]
RUN dotnet restore "src/ASAI.Admin/ASAI.Admin.csproj"
COPY . .
WORKDIR "/src/src/ASAI.Admin"
RUN dotnet build "ASAI.Admin.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ASAI.Admin.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_FORWARDEDHEADERS_ENABLED=true
ENTRYPOINT ["dotnet", "ASAI.Admin.dll"]