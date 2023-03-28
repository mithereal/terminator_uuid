defmodule Terminator.UUID.Repo do
  @moduledoc """
  Ecto repository
  """
  use Ecto.Repo,
    otp_app: :terminator_uuid,
    adapter: Ecto.Adapters.Postgres
end


defmodule Terminator.UUID.Repo.Null do
  use GenServer
  use Paginator

  def child_spec(init) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [init]},
      restart: :transient,
      type: :worker
    }
  end

  def start_link([]) do
    GenServer.start_link(__MODULE__, [], name: :ex_null_repo)
  end

  def init(init_arg) do
    {:ok, init_arg}
  end

  def all(_) do
    []
  end

  def all(_, _) do
    []
  end

  def get_by(_, _) do
    []
  end

  def get_by!(_, _) do
    []
  end

  def one(_, _) do
    []
  end
end