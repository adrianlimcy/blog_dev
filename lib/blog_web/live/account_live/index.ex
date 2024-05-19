defmodule BlogWeb.AccountLive.Index do
  use BlogWeb, :live_view
  alias Blog.Accounts

  @impl true
  def mount(_params, _sessions, socket) do
    {:ok, stream(socket, :accounts, Accounts.list_accounts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Accounts")
    |> assign(:comment, nil)
  end


end
