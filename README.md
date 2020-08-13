# Covid-19 Uganda API
A REST/GraphQ API created with Dart with the Aqueduct framework and Hasura, respectively, to provide access to data relating to the Covid-19 pandemic in Uganda
Deployed on Heroku with Hasura as the GraphQL as a service framework.

_Still very much a work in progress with some small improvements down the road_

REST API URL: https://ug-covid19-rest-api.herokuapp.com/

GRAPHQL API URL: https://covid19-uganda-graph-api.herokuapp.com/v1/graphql

_You may explore the GraphQl Endpoint by using any graphql playground of your choice. I suggest the use of [GraphQLBin](https://www.graphqlbin.com/v2/new) and then just paste in the above GraphQl Endpoint_ 

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
