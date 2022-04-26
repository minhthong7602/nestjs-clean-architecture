# Clean Architecture NestJs with CQRS, Domain Events

<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo_text.svg" width="320" alt="Nest Logo" /></a>
</p>

[travis-image]: https://api.travis-ci.org/nestjs/nest.svg?branch=master
[travis-url]: https://travis-ci.org/nestjs/nest
[linux-image]: https://img.shields.io/travis/nestjs/nest/master.svg?label=linux
[linux-url]: https://travis-ci.org/nestjs/nest
  
## Use Cases

- CQRS

- Domain Events

- CRUD

- Store data in MySql

- Unit Test Jest.

- CI/CD By Jenkins

## Overview

## Domain

This will contain all entities, events, enums, types and logic specific to the domain layer.

## Application

This layer contains all application logic. It is dependent on the domain layer and infranstructure

## Infrastructure

This layer contains classes for accessing database.

## WebAPI
This layer is REST API. This layer depends on the Application.


## Project structure

```
.
├── src
│   ├── api
│   │   ├── blogs
|   |   |     ├── blogs.controller.ts
│   │   │     └── blogs.module.ts
│   │   |
|   |   ├── users
|   |         ├── users.controller.ts
|   |         └── users.module.ts
│   │
│   └── applicant                             
│   |   ├── core
|   |   |    ├── auth
|   |   |    |    ├── auth.config.ts
|   |   |    |    ├── auth.service.ts
|   |   |    |    ├── auth.module.ts
|   |   |    |    └── ...etc
|   |   |    ├── config
|   |   |    |    ├── orm.config.ts
|   |   |    |    └── response-status.config.ts
|   |   |    |
|   |   |    ├── decorators
|   |   |    |    └── roles.decorator.ts
|   |   |    |
|   |   |    ├── exceptions-filter
|   |   |    |    ├── all-exception.filter.ts
|   |   |    |    ├── http-exception.filter.ts
|   |   |    |    └── not-found.filter.filter.ts
|   |   |    |
|   |   |    ├── middlewares
|   |   |    |    └── logger.middleware.ts
|   |   |    |
|   |   |    └── securities
|   |   |        └── security.service.ts
|   |   |       
|   |   |                  
│   |   ├── queries
|   |   |    ├── blogs
|   |   |    |    ├── listHome.query.ts
|   |   |    |    └── _index.ts
|   |   |    |
|   |   |    └── queries.module.ts
|   |   |                        
│   |   ├── commands
|   |   |    ├── blogs
|   |   |    |    ├── addOrUpdate.command.ts
|   |   |    |    └── _index.ts
|   |   |    |
|   |   |    ├── users
|   |   |    |    ├── change-password.command.ts
|   |   |    |    ├── login.command.ts
|   |   |    |    ├── register.command.ts
|   |   |    |    └── _index.ts
|   |   |    |
|   |   |    └── queries.module.ts
|   |   |                                             
│   |   └── events-handlers
|   |         ├── blogs
|   |         |    ├── send-push-update.handler.ts
|   |         |    ├── update-blog-update.handler.ts
|   |         |    └── _index.ts
|   |         |
|   |         └── events-handler.module.ts  
|   |    
|   ├── domain
|   |    ├── entities
|   |    |    ├── base.entity.ts
|   |    |    ├── blog.entity.ts 
|   |    |    ├── user.entity.ts
|   |    |    └── ...etc
|   |    |
|   |    └── events
|   |         ├── blogs
|   |         |    ├── send-push-update.event.ts
|   |         |    └── update-blog.event.ts
|   |         |
|   |         └── base.event.ts
|   |
|   ├── infrastructure
|   |    └── respositories
|   |        ├── base.repository.ts
|   |        ├── blog.repository.ts 
|   |        ├── user.repository.ts
|   |        └── ...etc
|   |
|   └── testing
|        └── security.service.spec.ts
|     
├── .dockerignore
├── Dockerfile
├── Jenkinsfile                               
├── package.json
├── nest-cli.json                          
├── README.md
├── tsconfig.build.json                       
└── tsconfig.json     
```



## Import Database By Query
```bash
$ cd database
$ mysql -u [user] -p bruceleeblog < backup.sql
```
- Change connection string in /src/application/core/configs/orm.config.ts

## Description
[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Running the app by NPM

```bash
# install
$ npm install
```

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```
## Running the app by Docker

```bash
# build docker image
$ docker build -t ${DOCKER_NAME}:${DOCKER_TAG} .

# stop and remove docker container same name
$ docker ps -aq --filter="name=${CONTAIERNAME_NAME}" | grep -q . && docker stop ${CONTAIERNAME_NAME} && docker rm ${CONTAIERNAME_NAME}

# run docker image
$ docker run -d --name ${CONTAIERNAME_NAME} -p 5000:5000 ${DOCKER_NAME}:${DOCKER_TAG}
```

## CI/CD
```bash
# run Jenkins by Docker
$ docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v ${DATA_PATH}:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) --user 1000:134 jenkins/jenkins:lts

# config docker plugin
https://stackoverflow.com/questions/47709208/how-to-find-docker-host-uri-to-be-used-in-jenkins-docker-plugin

# allow permission docker sock
sudo setfacl --modify user:${USER_NAME}:rw /var/run/docker.sock
```

## Stay in touch

- Author - MinhThong

## License

  Nest is [MIT licensed](LICENSE).