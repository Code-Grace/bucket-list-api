#!/bin/bash

curl --include --request POST http://127.0.0.1:3000/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "userName": "han@example.email",
      "password": "123"
    }
  }'
