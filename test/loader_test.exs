defmodule LoaderTest do
  use ExUnit.Case

  setup_all do
    countries = Loader.load()
    %{countries: countries}
  end

  describe "load/0" do
    test "loads a list of countries", %{countries: countries} do
      assert is_country_list?(countries)
    end

    test "all countries in the list have valid atttributes", %{countries: countries} do
      Enum.all?(countries, fn country ->
        assert is_valid_country?(country)
      end)
    end
  end

  # ------------------------------------------------------------------------------------
  # Test helpers
  # ------------------------------------------------------------------------------------
  defp is_country_list?(countries) do
    is_list(countries) and
      Enum.all?(countries, &is_country?/1)
  end

  defp is_country?(country) when is_struct(country) do
    %Country{} = country
  end

  defp is_country?(_), do: false

  # We expect all Country structs to have text values for every key.
  defp is_valid_country?(country) do
    is_struct(country) and
      is_binary(country.name) and
      is_binary(country.full_name) and
      is_binary(country.alpha_2) and
      is_binary(country.alpha_3) and
      is_binary(country.numeric) and
      is_binary(country.tld)
  end
end
