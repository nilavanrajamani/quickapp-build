FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash -
RUN apt-get install -y nodejs

WORKDIR /api

COPY . .

RUN dotnet restore

RUN dotnet publish -o /publish

WORKDIR /publish

ENTRYPOINT ["dotnet", "/publish/QuickApp.dll", "--urls", "http://0.0.0.0:5000"]