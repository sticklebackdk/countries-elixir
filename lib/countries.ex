defmodule Countries do
  @moduledoc false

  @doc """
  Returns all countries.
  """
  def all do
    countries()
  end

  @doc """
  Returns the country with the given alpha-2 code.
  """
  def get_by_alpha_2(alpha_2) do
    countries()
    |> Enum.find(fn country -> country.alpha_2 == alpha_2 end)
  end

  @doc """
  Returns the country with the given alpha-3 code.
  """
  def get_by_alpha_3(alpha_3) do
    countries()
    |> Enum.find(fn country -> country.alpha_3 == alpha_3 end)
  end

  # -- Load countries from JSON once on compile time ---

  @countries Loader.load()

  defp countries do
    @countries
  end
end
