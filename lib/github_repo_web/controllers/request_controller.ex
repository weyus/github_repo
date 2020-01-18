defmodule GithubRepoWeb.RequestController do
  use GithubRepoWeb, :controller

  def request(conn, _params) do
    render(conn, "request.html")
  end
end