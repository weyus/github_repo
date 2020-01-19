defmodule GithubRepoWeb.RepositoryView do
  use GithubRepoWeb, :view

  import GithubRepo.Constants

  def decode_message(org, msg) do
    display_message = case msg do
                        "Not Found" ->
                          "The organization #{org} was not found."
                        msg ->
                          "The repositories for organization #{org} were not displayable because #{msg}"
                      end
  end


  def get_names_and_links(org, repo_array) do
    Enum.map(repo_array, fn map -> Map.fetch!(map, "name") end)
    |> Enum.map(fn elem -> {elem, "#{urls()[:GITHUB_REPO_URL]}/#{org}/#{elem}"} end)
    |> Enum.sort()
  end
end
