# task GET index curl test

curl --include --request GET http://localhost:3000/tasks \
  --header "Authorization: Token token=bFfzn1Kfq5ZS/7MlMv+mHzM0c4SjhPKau2NnZ7mwbxk=--0zj+tfuySGG7tFLFnuzgYJ598QfbvEZgEssNLKkbQIA=" \

# task GET show curl test

curl --include --request GET http://localhost:3000/tasks/580629cc68097e018e32c8b6 \
  --header "Authorization: Token token=81uFm+iG9bfczR5a8z225EECmEt4GEDE8udeLPfqg8o=--k5giMQPRgyQ2pHB53CbWeu8ahREe3rFRp+wTxE0dAe0=" \

# task POST create curl test

curl --include --request POST http://localhost:3000/tasks \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=81uFm+iG9bfczR5a8z225EECmEt4GEDE8udeLPfqg8o=--k5giMQPRgyQ2pHB53CbWeu8ahREe3rFRp+wTxE0dAe0=" \
  --data '{
    "tasks": {
      "title": "my task",
      "description": "my first list"
    }
  }'

# task DELETE delete curl test

curl --include --request DELETE http://localhost:3000/tasks/58062f39526d0f085b5bdf1c \
  --header "Authorization: Token token=81uFm+iG9bfczR5a8z225EECmEt4GEDE8udeLPfqg8o=--k5giMQPRgyQ2pHB53CbWeu8ahREe3rFRp+wTxE0dAe0=" \

# task PATCH update curl test

curl --include --request PATCH http://localhost:3000/tasks/580629cc68097e018e32c8b6 \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=81uFm+iG9bfczR5a8z225EECmEt4GEDE8udeLPfqg8o=--k5giMQPRgyQ2pHB53CbWeu8ahREe3rFRp+wTxE0dAe0=" \
  --data '{
    "tasks": {
      "title": "my updated task",
      "description": "I been updated yall!",
      "completed": true
    }
  }'
