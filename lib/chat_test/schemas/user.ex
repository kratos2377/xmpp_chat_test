defmodule ChatTest.Schemas.User do
    use Ecto.Schema
    import Ecto.Changeset

    @type t :: %__MODULE__{
        id: Ecto.UUID.t(),
        first_name: String.t(),
        last_name: String.t(),
        password: String.t(),
        email: String.t(),
        username: String.t(),
        jid: String.t()
    }

    @primary_key{:id , :binary_id , []}
    schema "users" do
    field :email, :string
    field :password, :string
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :jid, :string

    timestamps()
    end


    def insert_changeset(user , attrs) do
        user 
        |> cast(attrs , [:first_name, :last_name , :email , :username , :password , :avatar_url, :super_admin])
        |> validate_required([:first_name, :last_name, :email , :username, :password, :avatar_url, :super_admin])
        |> update_change(:email, &String.downcase(&1))
        |> unique_constraint(:email)
        |> unique_constraint(:username)
        |> validate_format(:email , ~r/@mnit.ac.in/)
        |> validate_length(:username, min: 6 , max: 30)
        |> validate_length(:password, min: 6 , max: 20)
    end

end