defmodule GithubRepoWeb.Router do
  use GithubRepoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GithubRepoWeb do
    pipe_through :browser

    get "/", RequestController, :request
    resources "/repositories", RepositoryController, only: [:index]
  end

  # Other scopes may use custom stacks.
  # scope "/api", GithubRepoWeb do
  #   pipe_through :api
  # end
end
