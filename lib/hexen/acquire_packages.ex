defmodule Hexen.AcquirePackages do
  use HTTPoison.Base
  use GenStage

  @moduledoc """
  Mainly for testing - grabs a single package by name.
  """
  @spec get_packages_info(integer()) :: map()
  def get_package_info(name) do
    with {:ok, resp} <- Hexen.AcquirePackages.get("https://hex.pm/api/packages/" <> name),
         {:ok, status} when status in 200..299 <- Map.fetch(resp, :status_code),
         do: resp.body
  end


  @doc """
  The GenStage producer that hits the Hex API for mass package info. This can
  then be pushed down the pipe to the next consumer: the results should just
  be streamed out.

  It should continue to hit the Hex API until the pages of records are
  exhausted.

  FIXME need options added: want to allow specification of ordering/searching.
  """
  @spec get_packages_info(integer()) :: map()
  def get_packages_info(page \\ 1) do
    with {:ok, resp} <- Hexen.AcquirePackages.get("https://hex.pm/api/packages", [], params: %{page: page}),
         {:ok, status} when status in 200..299 <- Map.fetch(resp, :status_code),
         do: resp.body
  end


  ### Behavioural callbacks

  def process_headers(headers) do
    for {key, val} <- headers, into: %{}, do: {key, val}
  end

  def process_response_body(body) do
    Poison.decode!(body)
  end
end
