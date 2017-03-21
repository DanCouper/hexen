defmodule Hexen.Packages do
  use HTTPoison.Base
  alias __MODULE__, as: Packages

  @moduledoc """
  Utility functions that wrap the Hex API and allow information
  to be easily extracted.
  """

  @doc """
  Hits the Hex repo to grab a list of all current names of public
  packages.
  """
  @spec get_package_names :: [String.t()] | :error
  def get_package_names do
    Packages.get!("https://repo.hex.pm/names").body
    |> protobuf_sign()
    |> :hex_pb_names.decode_msg(:Names)
    |> Map.get(:packages)
    |> Enum.map(fn %{name: name} -> name end)
  end

  @doc """
  Given a name, hits the Hex repo to grab that package, returning
  a map of all the versions (including a list of dependencies for each).
  """
  def get_package(name) do
    Packages.get!("https://repo.hex.pm/packages/" <> name).body
    |> protobuf_sign()
    |> :hex_pb_package.decode_msg(:Package)
  end

  @doc """
  Given a name, hits the Hex API to grab info about that
  particular package
  """
  def get_package_info(name) do
    Packages.get!("https://hex.pm/api/packages/" <> name).body
    |> Poison.decode!
  end

  defp protobuf_sign(response) do
    response
    |> :zlib.gunzip
    |> :hex_pb_signed.decode_msg(:Signed)
    |> Map.get(:payload)
  end
end
