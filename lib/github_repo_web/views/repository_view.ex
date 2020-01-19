defmodule GithubRepoWeb.RepositoryView do
  use GithubRepoWeb, :view

  import GithubRepo.GithubApiClient
  import GithubRepo.Constants

  def get_names_and_links(org, repo_array) do
    Enum.map(repo_array, fn map -> Map.fetch!(map, "name") end)
    |> Enum.map(fn elem -> {elem, "#{urls[:GITHUB_REPO_URL]}/#{org}/#{elem}"} end)
    |> Enum.sort()
  end
end
