defmodule Mongo.Mixfile do
  use Mix.Project

  def project do
    [ app: :mongo,
      name: "mongo",
      version: "0.0.1",
      elixir: "~> 0.12.2",
      source_url: "https://github.com/checkiz/elixir-mongo",
      deps: deps(Mix.env),
      docs: &docs/0 ]
  end

  # Configuration for the OTP application
  def application do
    [applications: [:socket]]
  end
  
  # Returns the list of dependencies for prod
  defp deps(:prod) do
    [
      {:bson, github: "checkiz/elixir-bson"},
      {:socket, github: "meh/elixir-socket"}
    ]
  end

  # Returns the list of dependencies for docs
  defp deps(:docs) do
    deps(:prod) ++
      [{ :ex_doc, github: "elixir-lang/ex_doc" }]
  end
  defp deps(_), do: deps(:prod)

  defp docs do
    [ readme: true,
      main: "README",
      source_ref: System.cmd("git rev-parse --verify --quiet HEAD") ]
  end
end