defmodule Phoenix.Controller.Action do
  require Logger
  import Phoenix.Controller.Connection
  import Plug.Conn
  alias Phoenix.Config

  @moduledoc """
  Carries out Controller action after successful Router match and handles
  404 and 500 responses after route match
  """

  @doc """
  Performs Controller action, invoking the "2nd layer" Plug stack.

  Connection query string parameters are fetched automatically before
  controller actions are called, as well as merging any named parameters from
  the route definition.
  """
  def perform(conn, controller, action, named_params) do
    conn = assign_private(conn, :phoenix_named_params, named_params)
    |> assign_private(:phoenix_action, action)
    |> assign_private(:phoenix_controller, controller)

    apply(controller, :call, [conn, []])
  end

  @doc """
  Handles sending 404 response based on Router's Mix Config settings

  ## Router Configuration Options

    * error_controller - The optional Module to have `not_found/2` action invoked
                        when 404's status occurs.
                        Default `Phoenix.Controller.ErrorController`
    * debug_errors - Bool to display Phoenix's route debug page for 404 status.
                     Default `false`

  """
  def handle_not_found(conn) do
    conn   = put_in conn.halted, false
    router = router_module(conn)
    params = named_params(conn)

    if Config.router(router, [:debug_errors]) do
      perform conn, Phoenix.Controller.ErrorController, :not_found_debug, params
    else
      perform conn, Config.router!(router, [:error_controller]), :not_found, params
    end
  end


  @doc """
  Handles sending 500 response based on Router's Mix Config settings

  ## Router Configuration Options

    * error_controller - The optional Module to have `error/2` action invoked
                        when 500's status occurs.
                        Default `Phoenix.Controller.ErrorController`
    * catch_errors - Bool to catch errors at the Router level. Default `true`
    * debug_errors - Bool to display Phoenix's route debug page for 500 status.
                     Default `false`

  """

  def handle_error(conn) do
    conn   = put_in conn.halted, false
    router = router_module(conn)
    params = named_params(conn)

    log_error(conn)

    if Config.router(router, [:debug_errors]) do
      perform conn, Phoenix.Controller.ErrorController, :error_debug, params
    else
      perform conn, Config.router!(router, [:error_controller]), :error, params
    end
  end

  defp log_error(conn) do
    Logger.error fn ->
        err            = error(conn)
        stacktrace     = System.stacktrace
        exception      = Exception.normalize(:error, err)
        exception_type = exception.__struct__

      """
      #{inspect exception_type}) #{Exception.message(exception)}
      #{Exception.format_stacktrace stacktrace}
      """
    end
  end
end
