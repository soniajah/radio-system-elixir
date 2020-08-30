defmodule RadioSystemProject.Radiosystem.Radio do
  use Ecto.Schema
  import Ecto.Changeset

  schema "radios" do
    field :alias, :string
    field :location, :string
    field :allowed_locations, {:array, :string}
    timestamps()
  end

  @doc false
  def changeset(radio, attrs) do
    radio
    |> cast(attrs, [:alias, :allowed_locations])
    # |> validate_required([:alias, :location])
  end

  # @doc false
  def createnewentry(radio, attrs) do
    radio
    |> cast(attrs, [:alias, :allowed_locations])
    |> validate_required([:alias])
  end

  # @doc false
  def updatelocation(radio, location) do
    radio
    |> cast(%{location: location}, [:location])
    |> validate_required([:location])   
  end
end
