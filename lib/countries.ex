defmodule Countries do
  @moduledoc false

  @doc """
  Returns all countries.
  """
  def all do
    countries()
  end

  @doc """
  Returns the country with the given alpha-2 code. Returns `nil` if no country
  """
  def get_by_alpha_2(alpha_2) do
    countries()
    |> Enum.find(fn country -> country.alpha_2 == alpha_2 end)
  end

  @doc """
  Returns the country with the given alpha-2 code. Raises `ArgumentError` if no country
  """
  def get_by_alpha_2!(alpha_2) do
    get_by_alpha_2(alpha_2) || raise(ArgumentError, "No country with alpha-2 code #{alpha_2}")
  end

  @doc """
  Returns the country with the given alpha-3 code. Returns `nil` if no country
  """
  def get_by_alpha_3(alpha_3) do
    countries()
    |> Enum.find(fn country -> country.alpha_3 == alpha_3 end)
  end

  @doc """
  Returns the country with the given alpha-3 code. Raises `ArgumentError` if no country
  """
  def get_by_alpha_3!(alpha_3) do
    get_by_alpha_3(alpha_3) || raise(ArgumentError, "No country with alpha-3 code #{alpha_3}")
  end

  # -- Load countries from JSON once on compile time ---

  @countries Loader.load()

  defp countries do
    @countries
  end
end
