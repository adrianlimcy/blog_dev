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
30. Associate user table to stories table by modifying blog>stories>story.ex by changing field to belongs_to
31. Modify blog_web>live>home.html.heex to display user name
32. Add preload into stories.ex so that users are loaded when listing stories
33. OPTIONAL: clean up database
  - mix ecto.drop
  - mix ecto.create
  - mix ecto.migrate
34. Add preload into stories.ex so that we can see the name when we get(read) a story
35. mix phx.gen.live Comments Comment comments message:text story_id:references:stories
36. mix ecto.migrate
37. OPTIONAL: create the test.ex and test.html.heex to demo heex in heex in comment_live
38. Add test.html.heex into show.html.heex in story_live by using the correct html tag
39. steal the form component from comment index and put into story_live show.ex
40. mount comment in show.ex using a comment struct
41. edit the comment form in show.ex to allow only new comments
  - i.e. no need for edit
42. assosciate comment to stories
  - add story.id into the form component in show.ex
  - add the field for story.id in the comment form_component
    - make sure the value is written (@story_id)
  - change the story_id field and changeset in comment.ex
  - add has_many to stories so that there is a resolution for the deletion of stories for comments
43. Optional: Creating an index page for users
  - create the def list_accounts using Repo all in accounts.ex
  - create the folder account_live folder in blog_web/live
  - create the index.ex and the index.html.heex
44. enhance show.ex in stories to show comments
45. add list of comments
46. preload the comments in stories in stories.ex
47. associate comments to users
  - add belongs_to :user in comment.ex
  - mix ecto.gen.migration comment_has_user
  - mix ecto.migrate
48. Only users can comment, so add the if statement in show.html.heex
49. Preload users who made the comments in stories
48. Allow anonymous comments by using conditional statements when mounting
49. Ensure that the variables are passed between show.ex and show.html.heex
50. Copy and paste tailwind templates into the html.heex file
51. Pass tests (not really, fails story_id validation in the comment tests)
52. End

user and user passwords
test@test.com - testtesttest

