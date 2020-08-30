defmodule RadioSystemProject.Repo.Migrations.AddAllowedLocations do
  use Ecto.Migration

  def change do
    alter table(:radios) do
      add :allowed_locations, {:array, :string}
    end
  end
end
