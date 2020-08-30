defmodule RadioSystemProjectWeb.RadioController do
  use RadioSystemProjectWeb, :controller

  alias RadioSystemProject.Radiosystem
  alias RadioSystemProject.Radiosystem.Radio

  action_fallback RadioSystemProjectWeb.FallbackController

  def index(conn, _params) do
    radios = Radiosystem.list_radios()
    render(conn, "index.json", radios: radios)
  end

  def create(conn, %{"radio" => radio_params}) do
    with {:ok, %Radio{} = radio} <- Radiosystem.create_radio(radio_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.radio_path(conn, :show, radio))
      |> render("show.json", radio: radio)
    end
  end

  def show(conn, %{"id" => id}) do
    radio = Radiosystem.get_radio!(id)
    render(conn, "show.json", radio: radio)
  end

  def update(conn, %{"id" => id, "radio" => radio_params}) do
    radio = Radiosystem.get_radio!(id)

    with {:ok, %Radio{} = radio} <- Radiosystem.update_radio(radio, radio_params) do
      render(conn, "show.json", radio: radio)
    end
  end

  def delete(conn, %{"id" => id}) do
    radio = Radiosystem.get_radio!(id)

    with {:ok, %Radio{}} <- Radiosystem.delete_radio(radio) do
      send_resp(conn, :no_content, "")
    end
  end
end
