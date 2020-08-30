defmodule RadioSystemProject.RadiosystemTest do
  use RadioSystemProject.DataCase

  alias RadioSystemProject.Radiosystem

  describe "radios" do
    alias RadioSystemProject.Radiosystem.Radio

    @valid_attrs %{alias: "some alias", location: "some location"}
    @update_attrs %{alias: "some updated alias", location: "some updated location"}
    @invalid_attrs %{alias: nil, location: nil}

    def radio_fixture(attrs \\ %{}) do
      {:ok, radio} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Radiosystem.create_radio()

      radio
    end

    # test "list_radios/0 returns all radios" do
    #   radio = radio_fixture()
    #   assert Radiosystem.list_radios() == [radio]
    # end

    # test "get_radio!/1 returns the radio with given id" do
    #   radio = radio_fixture()
    #   assert Radiosystem.get_radio!(radio.id) == radio
    # end

    # test "create_radio/1 with valid data creates a radio" do
    #   assert {:ok, %Radio{} = radio} = Radiosystem.create_radio(@valid_attrs)
    #   assert radio.alias == "some alias"
    #   assert radio.location == "some location"
    # end

    # test "create_radio/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = Radiosystem.create_radio(@invalid_attrs)
    # end

    # test "update_radio/2 with valid data updates the radio" do
    #   radio = radio_fixture()
    #   assert {:ok, %Radio{} = radio} = Radiosystem.update_radio(radio, @update_attrs)
    #   assert radio.alias == "some updated alias"
    #   assert radio.location == "some updated location"
    # end

    # test "update_radio/2 with invalid data returns error changeset" do
    #   radio = radio_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Radiosystem.update_radio(radio, @invalid_attrs)
    #   assert radio == Radiosystem.get_radio!(radio.id)
    # end

    # test "delete_radio/1 deletes the radio" do
    #   radio = radio_fixture()
    #   assert {:ok, %Radio{}} = Radiosystem.delete_radio(radio)
    #   assert_raise Ecto.NoResultsError, fn -> Radiosystem.get_radio!(radio.id) end
    # end

    # test "change_radio/1 returns a radio changeset" do
    #   radio = radio_fixture()
    #   assert %Ecto.Changeset{} = Radiosystem.change_radio(radio)
    # end
  end
end
