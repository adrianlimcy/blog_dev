Steps:

1. mix phx.new blog
  - check DB username, password and other settings
2. mix ecto.create
3. iex -S mix phx.server
  - to test if everything is working fine for now
  - check by typing "localhost:4000" in browser
4. mix phx.gen.auth Accounts User users
  - to create user authentication
5. mix deps.get
6. mix ecto.migrate
7. mix test
  - make sure there is a postgres superuser account in the postgres installation
  - homebrew might now have it as default
8. mix phx.gen.live Stories Story stories title:string body:text user_id:references:users
9. copy the routes from the terminal into the authentication routes in router.ex
10. add "setup :register_and_log_in_user" in story_live_test.exs


