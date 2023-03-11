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

  describe "get_by_alpha2!/2" do
    test "returns the country with the given alpha-2 code" do
      assert "Germany" = Countries.get_by_alpha_2!("DE") |> Map.get(:name)
    end

    test "raises an error if the country does not exist" do
      assert_raise ArgumentError, "No country with alpha-2 code XX", fn ->
        Countries.get_by_alpha_2!("XX")
      end
    end
  end

  describe "get_by_alpha_3/1" do
    test "returns the country with the given alpha-3 code" do
      assert "Germany" = Countries.get_by_alpha_3("DEU") |> Map.get(:name)
    end
  end

  describe "get_by_alpha_3!/1" do
    test "returns the country with the given alpha-3 code" do
      assert "Germany" = Countries.get_by_alpha_3!("DEU") |> Map.get(:name)
    end

    test "raises an error if the country does not exist" do
      assert_raise ArgumentError, "No country with alpha-3 code XXX", fn ->
        Countries.get_by_alpha_3!("XXX")
      end
    end
  end

  describe "get_by_legacy_alpha_3/1" do
    test "returns the country with the given legacy alpha-3 code" do
      assert "Romania" = Countries.get_by_legacy_alpha_3("ROM") |> Map.get(:name)
    end
  end

  describe "get_by_legacy_alpha_3!/1" do
    test "returns the country with the given legacy alpha-3 code" do
      assert "Romania" = Countries.get_by_legacy_alpha_3!("ROM") |> Map.get(:name)
    end

    test "raises an error if the country does not exist" do
      assert_raise ArgumentError, "No country with legacy alpha-3 code XXX", fn ->
        Countries.get_by_legacy_alpha_3!("XXX")
      end
    end
  end
end
