defmodule RadioSystemProject.Radiosystem do
  @moduledoc """
  The Radiosystem context.
  """

  import Ecto.Query, warn: false
  alias RadioSystemProject.Repo

  alias RadioSystemProject.Radiosystem.Radio

  @doc """
  Returns the list of radios.

  ## Examples

      iex> list_radios()
      [%Radio{}, ...]

  """
  def list_radios do
    Repo.all(Radio)
  end

  @doc """
  Gets a single radio.

  Raises `Ecto.NoResultsError` if the Radio does not exist.

  ## Examples

      iex> get_radio!(123)
      %Radio{}

      iex> get_radio!(456)
      ** (Ecto.NoResultsError)

  """
  def get_radio!(id), do: Repo.get!(Radio, id)

  @doc """
  Creates a radio.

  ## Examples

      iex> create_radio(%{field: value})
      {:ok, %Radio{}}

      iex> create_radio(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_radio(attrs \\ %{}) do
    %Radio{}
    |> Radio.changeset(attrs)
    |> Repo.insert()
  end
  
  @doc """
  Updates a radio.

  ## Examples

      iex> update_radio(radio, %{field: new_value})
      {:ok, %Radio{}}

      iex> update_radio(radio, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_radio(%Radio{} = radio, attrs) do
    radio
    |> Radio.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a radio.

  ## Examples

      iex> delete_radio(radio)
      {:ok, %Radio{}}

      iex> delete_radio(radio)
      {:error, %Ecto.Changeset{}}

  """
  def delete_radio(%Radio{} = radio) do
    Repo.delete(radio)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking radio changes.

  ## Examples

      iex> change_radio(radio)
      %Ecto.Changeset{data: %Radio{}}

  """
  def change_radio(%Radio{} = radio, attrs \\ %{}) do
    Radio.changeset(radio, attrs)
  end

  @doc """
  Creates a radio with a specific id.    

  """
  def create_radio_with_id(id, attrs \\ %{}) do
    %Radio{id: id}
    |> Radio.createnewentry(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a radio location with a specific radio id.

  """
  def update_location(%Radio{} = radio, location) do
    radio
    |> Radio.updatelocation(location)
    |> Repo.update()
  end
end
