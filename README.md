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
Adding user_id into the DB story entries
11. add the user_id into the live component in index.html.heex
  - user_id = {@current_user.id}
12. add user_id in the story.ex changeset for ecto
13. map user_id into the story_params
14. Enforce Authencation
  - created new def with added variables in list_stories within story.ex in blog
  - created new getstory! within story.ex in blog
  - added a variable when mounting in story_live/index.ex
  - added a variable when editing and deleting in story_live/index.ex
15. Copy the index.ex and index.html.heex from story_live folder to paste inside story_live folder
16. Change the copied index.ex and index.html.heex to home.ex and home.html.heex
17. Change the home route in router.ex to a live end point - StoryLive.home
18. Modify home.ex to get all stories without parameters
19. Modify home.ex to :home instead of :index
20. Modify home.html.heex to remove unnecessary buttons
21. Disable show/edit in router.ex
22. Clean up show.html.heex in story_live to disable editing modal
23. Add navigation to root.html.heeex in layouts
24. Move the show endpoint to the public route in router.ex
  - Ensure that this line is after the authencated new story line so that there is no error
25. add the field name in blog>accounts>user.ex
26. mix ecto.gen.migration add_name
27. alter (not create) the user table and add the field name in the migration file
28. update blog>accounts>user.ex in the registration_changeset to include the name parameter
29. Go to blog_web>live>user_registration_live to include name field


user and user passwords
test@test.com - testtesttest

