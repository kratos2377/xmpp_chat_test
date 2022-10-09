defmodule ChatTest.Schemas.User do

    @primary_key{:id , :binary_id , []}
    schema "users" do
    field :email, :string
    field :password, :string
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :jid, :string
    end

end