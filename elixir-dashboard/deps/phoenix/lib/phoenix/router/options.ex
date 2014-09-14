defmodule Phoenix.Router.Options do
  alias Phoenix.Config

  @doc """
  Merges Plug options with dispatch options, delegating to adapter module for
  adapter specific option handling

    * options - The Plug routing options, ie, [port: 4000, ip: {127, 0, 0, 1}]
    * dispatch_options - The adapter dispatch_options built from `dispatch_option` macro
    * adapter - The webserver adapter module to handle adapter spefic options, ie `Adapters.Cowboy`

  """
  def merge(options, dispatch_options, router_module, adapter) do
    Config.router(router_module)
    |> map_config
    |> Dict.merge(options)
    |> adapter.merge_options(dispatch_options, router_module)
  end

  defp map_config([]), do: []
  defp map_config([{k, v}|t]), do: [option(k,v)] ++ map_config(t)

  defp option(:port, val), do: { :port, convert(:int, val) }
  defp option(:proxy_port, val), do: { :proxy_port, convert(:int, val) }
  defp option(key, val), do: { key, val }

  defp convert(:int, val) when is_integer(val), do: val
  defp convert(:int, val), do: String.to_integer(val)
end
