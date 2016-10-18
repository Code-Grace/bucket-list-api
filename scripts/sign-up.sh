#!/bin/bash

curl --include --request POST http://127.0.0.1:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'

curl --include --request POST http://127.0.0.1:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "userName": "han1@example.email",
      "yearOfBirth": "1993",
      "password": "123"
    }
  }'

curl --include --request GET https://deathbucket.herokuapp.com/

curl --include --request POST https://deathbucket.herokuapp.com/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "userName": "d@example.email",
      "yearOfBirth": "1993",
      "password": "1"
    }
  }'

  curl --include --request POST https://deathbucket.herokuapp.com/sign-up  \
    --header "Content-Type: application/json" \
    --data '{
      "credentials": {
        "email": "an@example.email",
        "password": "an example password",
        "password_confirmation": "an example password"
      }
    }'
