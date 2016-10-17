# list GET index curl test

curl --include --request GET http://localhost:3000/users/$ID \
  --header "Authorization: Token token=$TOKEN"

# list POST create curl test

curl --include --request POST http://localhost:3000/list \
  --header "Content-Type: application/json" \
  --data '{
    "list": {
      "title": "my list"
    }
  }'
