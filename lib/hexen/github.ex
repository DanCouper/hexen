defmodule Hexen.Github do
  use HTTPoison.Base
  alias __MODULE__, as: Github
  @moduledoc """
  Utility function that wraps the Github API and allow information
  to be easily extracted.

  Pares the returned fields down to a manageable amount, and
  makes the keys atoms.

  Should be ran
  """

  @expected_fields ~w(
    id full_name owner description html_url url homepage stargazers_count
    watchers_count has_issues has_downloads has_wiki has_pages forks_count
    open_issues_count forks open_issues created_at updated_at
  )

  @owner_fields ~w(
    followers_url following_url gists_url html_url id login
    organizations_url repos_url subscriptions_url url
  )

  def get_repo_info(url) do
    Github.get!(url).body
  end

  def get_repo_info(user, repo) do
    Github.get!("https://api.github.com/repos/" <> user <> "/" <> repo).body
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    |> process_owner_info
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  def process_owner_info(fields) do
    owner_fields = fields
      |> Map.get("owner")
      |> Map.take(@owner_fields)
      |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)

    Map.put(fields, "owner", owner_fields)
  end
end
