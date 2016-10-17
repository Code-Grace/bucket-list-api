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
