defmodule Terminator.UUID.Factory do
  use ExMachina.Ecto, repo: Terminator.UUID.Repo
  alias Terminator.UUID.Performer
  alias Terminator.UUID.Ability
  alias Terminator.UUID.Role

  def performer_factory do
    %Performer{}
  end

  def ability_factory do
    %Ability{
      identifier: sequence(:role, ["view_post", "delete_post", "create_post"])
    }
  end

  def role_factory do
    %Role{
      identifier: sequence(:role, ["admin", "editor", "user"]),
      name: sequence(:role_name, &"Generated role-#{&1}")
    }
  end
end
