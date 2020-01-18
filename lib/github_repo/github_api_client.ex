defmodule GithubRepo.GithubApiClient do
  # require [HTTPoison, Poison]

  def retrieve_repos_for(org) do
    url = "#{constants()[:GITHUB_URL]}/orgs/#{org}/repos"

    case fetch(url) do
      {:ok, body} -> process_results(body)
      {:error, reason} -> handle_error(url, reason)
    end
  end

  defp constants do
    %{GITHUB_URL: "https://api.github.com"}
  end

  #Maybe pull this out somewhere and reuse it in future so allow for arbitrary headers to be passed in.
  defp fetch(url, headers \\ default_headers()) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: body}} -> {:ok, body}
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  defp default_headers() do
    [{"Accept", "application/vnd.github.v3+json"}]
  end

  # Parse results of fetch into array of repo names
  defp process_results(body) do
    body
    |> Poison.decode()
    |> case do
         {:ok, repo_array} ->
           {:ok, repo_array
                 |> Enum.map(fn(repo_data) -> Map.take(repo_data, ["name", "html_url"]) end)}
         _ -> {:error, body}
       end
  end

  defp handle_error(url, reason) do
    {:error, "There was an error fetching from URL #{url} because of #{reason}"}
  end
end