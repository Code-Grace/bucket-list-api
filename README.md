[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Bucket-List-API

Front-end client repo: https://github.com/Code-Grace/bucket-list-browser-template
Client website: https://code-grace.github.io/bucket-list-browser-template/

A template for starting projects with `express` as an API. Includes
authentication and common middlewares.

This template follows Rails-like conventions for organizing controller and
model code, and has a routing layer which is similar to the Rails routing DSL.

## API

Use this as the basis for your own API documentation. Add a new third-level
heading for your custom entities, and follow the pattern provided for the
built-in user authentication documentation.

Scripts are included in [`scripts`](scripts) to test built-in actions. Add your
own scripts to test your custom API.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://127.0.0.1:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "userName": "user_name",
      "yearOfBirth": "1993",
      "description": "my description",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "userName": "user_name",
    "yearOfBirth": "1993",
    "description": "my description",
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://127.0.0.1:3000/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "userName": "user_name",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "userName": "my_name",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://127.0.0.1:3000/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://127.0.0.1:3000/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://127.0.0.1:3000/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "userName": "user_name"
    },
    {
      "id": 1,
      "userName": "user_name"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://127.0.0.1:3000/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "userName": "another@example.userName"
  }
}
```
### Tasks

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/tasks`    | `tasks#index`     |
| GET  | `/tasks/$ID`| `tasks#show`      |
| POST | `/tasks`    | `tasks#create`    |
| PATCH| `/tasks/$ID`| `tasks#update`    |
| DELETE| `/tasks`   | `tasks#destroy`   |

#### GET /tasks

Request:

```sh
curl --include --request GET http://127.0.0.1:3000/tasks \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/tasks.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "tasks": [
    {
      "_id": $ID,
      "title": "title",
      "description": "description",
      "completed": "completed"
    },
    {
      "_id": $ID,
      "title": "title",
      "description": "description",
      "completed": "completed"
    }
  ]
}
```

#### GET /tasks/:id

Request:

```sh
curl --include --request GET http://127.0.0.1:3000/tasks/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "_id": $ID,
  "title": "title",
  "description": "description",
  "completed": "completed"
  }
}
```

#### POST /tasks

Request:

```sh
curl --include --request POST http://127.0.0.1:3000/tasks \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=lsYjQw573IuOVbCQYV/QeD9oFeUeZ+zhZZIfxiW8XgU=--uVSLg1CU1k6vgiyaqDiYvUHXzUvrzCWdLT99Fn3+eMg=" \
  --data '{
    "tasks": {
      "title": "my task",
      "description": "my first list"
    }
  }'
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/task.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "_id": $ID,
  "title": "title",
  "description": "description",
  "completed": "completed"
  }
}
```

#### PATCH /tasks/$ID

Request:

```sh
curl --include --request PATCH http://127.0.0.1:3000/tasks/$ID \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=lsYjQw573IuOVbCQYV/QeD9oFeUeZ+zhZZIfxiW8XgU=--uVSLg1CU1k6vgiyaqDiYvUHXzUvrzCWdLT99Fn3+eMg=" \
  --data '{
    "tasks": {
      "title": "my updated task",
      "description": "updated",
      "completed": true
    }
  }'
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/task.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "_id": $ID,
  "title": "title",
  "description": "description",
  "completed": "completed"
  }
}
```

#### DELETE /tasks/$ID

Request:

```sh
curl --include --request DELETE http://127.0.0.1:3000/tasks/$ID \
  --header "Authorization: Token token=lsYjQw573IuOVbCQYV/QeD9oFeUeZ+zhZZIfxiW8XgU=--uVSLg1CU1k6vgiyaqDiYvUHXzUvrzCWdLT99Fn3+eMg=" \
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/task.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "_id": $ID,
  "title": "title",
  "description": "description",
  "completed": "completed"
  }
}
```

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
