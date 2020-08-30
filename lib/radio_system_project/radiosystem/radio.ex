defmodule RadioSystemProject.Radiosystem.Radio do
  use Ecto.Schema
  import Ecto.Changeset

  schema "radios" do
    field :alias, :string
    field :location, :string

    timestamps()
  end

  @doc false
  def changeset(radio, attrs) do
    radio
    |> cast(attrs, [:alias, :location])
    |> validate_required([:alias, :location])
  end
end
