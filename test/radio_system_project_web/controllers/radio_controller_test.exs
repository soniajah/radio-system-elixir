defmodule RadioSystemProjectWeb.RadioControllerTest do
  use RadioSystemProjectWeb.ConnCase

  alias RadioSystemProject.Radiosystem
  alias RadioSystemProject.Radiosystem.Radio

  @create_attrs %{
    alias: "some alias",
    location: "some location"
  }
  @update_attrs %{
    alias: "some updated alias",
    location: "some updated location"
  }
  @invalid_attrs %{alias: nil, location: nil}

  def fixture(:radio) do
    {:ok, radio} = Radiosystem.create_radio(@create_attrs)
    radio
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all radios", %{conn: conn} do
      conn = get(conn, Routes.radio_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create radio" do
    test "renders radio when data is valid", %{conn: conn} do
      conn = post(conn, Routes.radio_path(conn, :create), radio: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.radio_path(conn, :show, id))

      assert %{
               "id" => id,
               "alias" => "some alias",
               "location" => "some location"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.radio_path(conn, :create), radio: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update radio" do
    setup [:create_radio]

    test "renders radio when data is valid", %{conn: conn, radio: %Radio{id: id} = radio} do
      conn = put(conn, Routes.radio_path(conn, :update, radio), radio: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.radio_path(conn, :show, id))

      assert %{
               "id" => id,
               "alias" => "some updated alias",
               "location" => "some updated location"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, radio: radio} do
      conn = put(conn, Routes.radio_path(conn, :update, radio), radio: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete radio" do
    setup [:create_radio]

    test "deletes chosen radio", %{conn: conn, radio: radio} do
      conn = delete(conn, Routes.radio_path(conn, :delete, radio))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.radio_path(conn, :show, radio))
      end
    end
  end

  defp create_radio(_) do
    radio = fixture(:radio)
    %{radio: radio}
  end
end
