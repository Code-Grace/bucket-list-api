#!/bin/bash

curl --include --request GET http://127.0.0.1:3000/users/$ID \
  --header "Authorization: Token token=$TOKEN"
