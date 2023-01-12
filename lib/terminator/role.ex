defmodule Terminator.UUID.Role do
  @moduledoc ~S"""
  Role is grouped representation of multiple abilities.
  It allows you to assign or manage multiple roles at once.

  """

  use Terminator.UUID.Schema
  import Ecto.Changeset

  alias __MODULE__

  @typedoc "A role struct"
  @type t :: %Role{}

  schema "terminator_uuid_roles" do
    field(:identifier, :string)
    field(:name, :string)
    field(:abilities, {:array, :string}, default: [])

    many_to_many(:performers, Terminator.UUID.Performer, join_through: Terminator.UUID.PerformersRoles)

    timestamps()
  end

  @spec changeset(struct :: Role.t(), params :: map() | nil) :: Ecto.Changeset.t()
  def changeset(%Role{} = struct, params \\ %{}) do
    struct
    |> cast(params, [:identifier, :name, :abilities])
    |> validate_required([:identifier, :name])
    |> unique_constraint(:identifier, message: "Role already exists")
  end

  @doc """
  Builds ecto changeset for a role.

  ## Examples

      iex> changeset = Terminator.UUID.Role.build("admin", ["delete_account"], "Administrator of application")
      #Ecto.Changeset<
        action: nil,
        changes: %{
        abilities: ["delete_account"],
        identifier: "admin",
        name: "Administrator of application"
      },
      errors: [],
      data: #Terminator.UUID.Role<>,
      valid?: true
      >
      iex> changeset |> Repo.insert
      {:ok,
      %Terminator.UUID.Role{
        __meta__: #Ecto.Schema.Metadata<:loaded, "terminator_uuid_roles">,
        abilities: ["delete_account"],
        id: 1,
        identifier: "admin",
        inserted_at: ~N[2019-01-03 19:50:13],
        name: "Administrator of application",
        updated_at: ~N[2019-01-03 19:50:13]
      }}

  """
  @spec build(identifier :: String.t(), abilities :: list(String.t()), name :: String.t()) ::
          Ecto.Changeset.t()
  def build(identifier, abilities, name) do
    changeset(%Role{}, %{
      identifier: identifier,
      abilities: abilities,
      name: name
    })
  end

  @doc """
  Grant `Terminator.UUID.Ability` to a role.

  ## Examples

  Function accepts `Terminator.UUID.Ability`  grant.
  Function is merging existing grants with the new ones, so calling grant with same
  grants will not duplicate entries in table.

  To grant particular ability to a role

      iex> Terminator.UUID.Performer.grant(%Terminator.UUID.Role{id: 1}, %Terminator.UUID.Ability{identifier: "manage"})

  """

  @spec grant(Role.t(), Terminator.UUID.Ability.t()) :: Role.t()
  def grant(%Role{id: _id} = role, %Terminator.UUID.Ability{identifier: _identifier} = ability) do
    # Preload performer abilityies
    abilities = Enum.uniq(role.abilities ++ [ability.identifier])

    changeset =
      changeset(role)
      |> put_change(:abilities, abilities)

    changeset |> Terminator.UUID.Repo.update!()
  end

  def grant(_, _), do: raise(ArgumentError, message: "Bad arguments for giving grant")

  @doc """
  Revoke `Terminator.UUID.Ability` from a role.

  ## Examples

  Function accepts `Terminator.UUID.Ability` grant.
  Function is directly opposite of `Terminator.UUID.Role.grant/2`

  To revoke particular ability from a given role

      iex> Terminator.UUID.Performer.revoke(%Terminator.UUID.Role{id: 1}, %Terminator.UUID.Ability{identifier: "manage"})

  """
  @spec revoke(Role.t(), Terminator.UUID.Ability.t()) :: Role.t()
  def revoke(%Role{id: _id} = role, %Terminator.UUID.Ability{identifier: _identifier} = ability) do
    abilities =
      Enum.filter(role.abilities, fn grant ->
        grant != ability.identifier
      end)

    changeset =
      changeset(role)
      |> put_change(:abilities, abilities)

    changeset |> Terminator.UUID.Repo.update!()
  end

  def revoke(_, _), do: raise(ArgumentError, message: "Bad arguments for revoking grant")
end
