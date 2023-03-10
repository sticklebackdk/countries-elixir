defmodule Country do
  @moduledoc """
  A country.
  """
  @enforce_keys [:name, :full_name, :alpha_2, :alpha_3, :numeric, :tld]
  defstruct [:name, :full_name, :alpha_2, :alpha_3, :numeric, :tld]
end
