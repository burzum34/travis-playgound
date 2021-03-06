defmodule TravisPlayground.MixProject do
  use Mix.Project

  def project do
    [
      app: :travis_playground,
      version: "0.0.8",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distillery, "~> 1.5", runtime: false}
    ]
  end
end
