defmodule GithubRepo.Repo do
  use Ecto.Repo,
    otp_app: :github_repo,
    adapter: Ecto.Adapters.Postgres
end
