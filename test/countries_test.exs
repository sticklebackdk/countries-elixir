defmodule CountriesTest do
  use ExUnit.Case

  # Count of officially assigned country codes
  # Source: https://www.iso.org/obp/ui/#search
  @country_count 249

  describe "all/0" do
    test "returns all countries" do
      assert @country_count = Countries.all() |> length()
    end
  end

  describe "get_by_alpha_2/1" do
    test "returns the country with the given alpha-2 code" do
      assert "Germany" = Countries.get_by_alpha_2("DE") |> Map.get(:name)
    end
  end

  describe "get_by_alpha_3/1" do
    test "returns the country with the given alpha-3 code" do
      assert "Germany" = Countries.get_by_alpha_3("DEU") |> Map.get(:name)
    end
  end
end
