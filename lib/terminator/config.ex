defmodule Terminator.UUID.Config do
  @doc """
  Return value by key from config.exs file.
  """

  alias ExCatalog.InvalidConfigError

  def get(name, default \\ nil) do
    Application.get_env(:terminator_uuid, name, default)
  end

  def repo, do: List.first(Application.fetch_env!(:terminator_uuid, :ecto_repos))
  def repos, do: Application.fetch_env!(:terminator_uuid, :ecto_repos)

  @spec config() :: Keyword.t() | none()
  def config() do
    case Application.get_env(:terminator_uuid, :ecto_repos, :not_found) do
      :not_found ->
        raise InvalidConfigError, "terminator_uuid config not found"

      config ->
        if not Keyword.keyword?(config) do
          raise InvalidConfigError,
                "terminator_uuid config was found, but doesn't contain a keyword list."
        end

        config
    end
  end

  def key_type() do
    case Application.get_env(:terminator_uuid, repo())[:primary_key_type] do
      nil -> :integer
      _ -> :binary_id
    end
  end

  def key_type(:migration) do
    case Application.get_env(:terminator_uuid, repo())[:primary_key_type] do
      nil -> :integer
      _ -> :uuid
    end
  end
end
