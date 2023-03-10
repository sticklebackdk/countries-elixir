defmodule Loader do
  @moduledoc false

  @countries_file "priv/data/countries/countries.json"
  @doc """
  Loads the countries data from the JSON file.
  """
  def load do
    @countries_file
    |> File.read!()
    |> Jason.decode!()
    |> Enum.map(&convert/1)
  end

  # -- Convert country map to struct ---
  defp convert(%{} = country) do
    %Country{
      name: country["name"],
      full_name: country["full_name"],
      alpha_2: country["alpha_2"],
      alpha_3: country["alpha_3"],
      numeric: country["numeric"],
      tld: country["tld"]
    }
  end
end
