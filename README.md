# UserPhotoAPI

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Endpoints
### Login
`POST localhost:4000/api/auth/login?user[email]=:email&user[password]=:password`
```
{
  "data": {
    "user_id": 1,
    "jwt": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOjciLCJleHAiOjE0OTgzNzg4MjIsImlhdCI6MTQ5NTc4NjgyMiwiaXNzIjoiVXNlclBob3RvQVBJIiwianRpIjoiZDFlYWYwNmUtMzIxNS00ODE4LWEwZTAtOWViMzViOGQ0ODZkIiwicGVtIjp7fSwic3ViIjoiVXNlcjo3IiwidHlwIjoiYWNjZXNzIn0.pWPkuiBjYIrNCOOXZwAL5jRYPddrtxLxGkwoef40AwwWuqNFCjReJdDMh4m2d_dbTPIeqAZCcfqwomAYPMTPCw"  # => keep this
  }
}
```


### Photo
In order to access the photo endpoints, you have to add a key of `Authorization` and value of `Bearer :jwt` in the header where `:jwt`'s value is the return from `api/auth/login` above.
`Authorization: Bearer :jwt`

### Post photo
NOTE: You can use apps such as [Postman](https://www.getpostman.com/) for you to be able to attach a file in the POST request.
`POST localhost:4000/api/photos/:photo_id`
Required request parameters/body:
Key: `photo[image]` Value: Attach file using [Postman](https://www.getpostman.com/)
```
{
  "data": {
    "user_id": 1,
    "url": "/uploads/15784685_10205641123106592_1591799532_o.jpg?v=63663005495",
    "likes_user_ids": [
      1
    ],
    "likes_count": 1,
    "id": 1
  }
}
```
NOTE: You can view the photo by visiting the url by prepending the localhost `localhost:4000/uploads/15784685_10205641123106592_1591799532_o.jpg?v=63663005495`

### View photo
`POST localhost:4000/api/photos/1`
```
{
  "data": {
    "user_id": 1,
    "url": "/uploads/15784685_10205641123106592_1591799532_o.jpg?v=63663005495",
    "likes_user_ids": [
      1
    ],
    "likes_count": 1,
    "id": 1
  }
}
```

### Like a photo
POST localhost:4000/api/photos/:photo_id/like
```
{
  "data": {
    "user_id": 1,
    "url": "/uploads/15784685_10205641123106592_1591799532_o.jpg?v=63663005495",
    "likes_user_ids": [
      1
    ],
    "likes_count": 1,
    "id": 1
  }
}
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
