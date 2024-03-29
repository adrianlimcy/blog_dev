defmodule BlogWeb.StoryLive.Index do
  use BlogWeb, :live_view

  alias Blog.Stories
  alias Blog.Stories.Story

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :stories, Stories.list_stories(socket.assigns[:current_user].id))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Story")
    |> assign(:story, Stories.get_story!(id, socket.assigns.current_user.id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Story")
    |> assign(:story, %Story{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Stories")
    |> assign(:story, nil)
  end

  @impl true
  def handle_info({BlogWeb.StoryLive.FormComponent, {:saved, story}}, socket) do
    {:noreply, stream_insert(socket, :stories, story)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    story = Stories.get_story!(id, socket.assigns.current_user.id)
    {:ok, _} = Stories.delete_story(story)

    {:noreply, stream_delete(socket, :stories, story)}
  end
end
