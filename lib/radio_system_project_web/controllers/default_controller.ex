defmodule RadioSystemProjectWeb.DefaultController do
    use RadioSystemProjectWeb, :controller
  
    def index(conn, _params) do
      text conn, "Radio System Project"
    end    
  end