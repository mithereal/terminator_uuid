defmodule Terminator.UUID.Repo do
  @moduledoc """
  Ecto repository
  """

  use Ecto.Repo,
    otp_app: :terminator_uuid,
    adapter: Ecto.Adapters.Postgres
end
