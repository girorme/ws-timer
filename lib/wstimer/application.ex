defmodule Wstimer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, args) do
    children = [
      # Start the Telemetry supervisor
      WstimerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wstimer.PubSub},
      # Start the Endpoint (http/https)
      WstimerWeb.Endpoint,
      # Start a worker by calling: Wstimer.Worker.start_link(arg)
      # {Wstimer.Worker, arg}
      {Wstimer.Timer, args}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wstimer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WstimerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
