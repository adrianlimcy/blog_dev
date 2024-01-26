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


