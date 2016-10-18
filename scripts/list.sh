# task GET index curl test

curl --include --request GET http://localhost:3000/users/$ID \
  --header "Authorization: Token token=$TOKEN"

# task POST create curl test

curl --include --request POST http://localhost:3000/tasks \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=OkAglzLqsH/DtPozusTj+nRwQTWK+L31WRP1omn+3dU=--Dm9QqiVKPLDLGuhuNmKwnmwZO7C22mg2d1VzH+7c8bM=" \
  --data '{
    "tasks": {
      "title": "my task",
      "description": "my first list"
    }
  }'
