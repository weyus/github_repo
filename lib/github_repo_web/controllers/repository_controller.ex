defmodule GithubRepoWeb.RepositoryController do
  use GithubRepoWeb, :controller

  import GithubRepo.GithubApiClient

  def index(conn, %{"organization" => organization}) do
    case retrieve_repos_for(organization) do
      {:message, message} -> render(conn, "index.html", %{organization: organization, message: message})
      {:ok, repo_array} -> render(conn, "index.html", %{organization: organization, repo_array: repo_array})
      {:error, error_text} -> render(conn, "index.html")
    end
  end
end
