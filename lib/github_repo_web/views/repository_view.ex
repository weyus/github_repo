defmodule GithubRepoWeb.RepositoryView do
  use GithubRepoWeb, :view

  def get_names(repo_array) do
    Enum.map(repo_array, fn map -> Map.fetch!(map, "name") end)
    |> Enum.sort()
  end
end
