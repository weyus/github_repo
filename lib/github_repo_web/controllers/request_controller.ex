defmodule GithubRepoWeb.RequestController do
  use GithubRepoWeb, :controller

  def repo_request(conn, _params) do
    render(conn, "repo_request.html")
  end
end