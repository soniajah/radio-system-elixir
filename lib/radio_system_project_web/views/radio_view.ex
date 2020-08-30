defmodule RadioSystemProjectWeb.RadioView do
  use RadioSystemProjectWeb, :view
  alias RadioSystemProjectWeb.RadioView

  def render("index.json", %{radios: radios}) do
    %{data: render_many(radios, RadioView, "radio.json")}
  end

  def render("show.json", %{radio: radio}) do
    %{data: render_one(radio, RadioView, "radio.json")}
  end

  def render("radio.json", %{radio: radio}) do
    %{id: radio.id,
      alias: radio.alias,
      location: radio.location}
  end
end
