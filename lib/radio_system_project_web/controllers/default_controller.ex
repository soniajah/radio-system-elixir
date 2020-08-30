defmodule RadioSystemProjectWeb.DefaultController do
    use RadioSystemProjectWeb, :controller
  
    def index(conn, _params) do
      text conn, "RadioSystemProjectWeb!"
    end

    def index2(conn, _params) do
        text conn, "Hello!"
      end
  end