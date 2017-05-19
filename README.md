# UserPhotoAPI

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Routes
```
POST localhost:4000/api/auth/login?user[email]=:email&user[password]=:password
POST localhost:4000/api/users?user[email]=:email&user[password]=:password

POST localhost:4000/api/photos?photo[url]=:url&photo[user_id]=:user_id
GET  localhost:4000/api/photos/:photo_id
POST localhost:4000/api/photos/:photo_id/like?user_id=:user_id
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
