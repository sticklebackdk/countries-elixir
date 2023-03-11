defmodule Country do
  @moduledoc """
  A country.
  """
  @enforce_keys [:name, :full_name, :alpha_2, :alpha_3, :numeric, :tld]
  @type t :: %__MODULE__{
          name: String.t(),
          full_name: String.t(),
          informal_name: String.t() | nil,
          alpha_2: String.t(),
          alpha_3: String.t(),
          legacy_alpha_3: String.t() | nil,
          numeric: String.t(),
          tld: String.t()
        }
  defstruct [
    :name,
    :full_name,
    :alpha_2,
    :alpha_3,
    :numeric,
    :tld,
    informal_name: nil,
    legacy_alpha_3: nil
  ]
end
