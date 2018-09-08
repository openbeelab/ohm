[![Build Status](https://travis-ci.org/openbeelab/ohm.svg?branch=master)](https://travis-ci.org/openbeelab/ohm)

## Install

```
docker-compose up -d
docker-compose exec web rake db:create
docker-compose exec web rake db:migrate
```
