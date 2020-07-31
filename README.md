# Covid-19 Uganda API
A REST API created with Dart with the Aqueduct framework to provide access to data relating to the Covid-19 pandemic in Uganda.
Deployed on Heroku. A GraphQL version of this API is in the works. More information soon.

![GitHub deployments](https://img.shields.io/github/deployments/TJMusiitwa/Covid19-Uganda-REST-API/covid19-uganda-rest-api?label=Heroku%20Deploy&style=for-the-badge) ![GitHub repo size](https://img.shields.io/github/repo-size/TJMusiitwa/Covid19-Uganda-REST-API?style=for-the-badge) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/TJMusiitwa/Covid19-Uganda-REST-API?style=for-the-badge) ![GitHub top language](https://img.shields.io/github/languages/top/TJMusiitwa/Covid19-Uganda-REST-API?style=for-the-badge)

### Documentation
The REST API is self-documenting and you can access the OpenAPI documentation from the `/client` endpoint.

## Running the Application Locally

Run `aqueduct serve` from this directory to run the application. For running within an IDE, run `bin/main.dart`. By default, a configuration file named `config.yaml` will be used.

To generate a SwaggerUI client, run `aqueduct document client`.

## Running Application Tests

To run all tests for this application, run the following in this directory:

```
pub run test
```

The default configuration file used when testing is `config.src.yaml`. This file should be checked into version control. It also the template for configuration files used in deployment.

## Deploying an Application

See the documentation for [Deployment](https://aqueduct.io/docs/deploy/).