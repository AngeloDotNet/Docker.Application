FROM mcr.microsoft.com/dotnet/sdk:8.0 AS base
WORKDIR /webapp

FROM base as deps
COPY *.csproj .
RUN dotnet restore

FROM deps as build
COPY . .
RUN dotnet publish -c Release -o compiled

FROM mcr.microsoft.com/dotnet/aspnet:8.0 as deploy
ENV ASPNETCORE_URLS=http://*:5001
ENV ASPNETCORE_ENVIRONMENT="production"
COPY --from=build /webapp/compiled .

EXPOSE 5001
ENTRYPOINT ["dotnet", "NOME-APP.dll"]