defmodule GithubRepo.Constants do
  @urls %{GITHUB_API_URL: "https://api.github.com",
          GITHUB_REPO_URL: "https://github.com"}

  def urls, do: @urls
end