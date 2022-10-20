defmodule ChatTest.Mutations.User do
    import Ecto.Query, warn: false
    alias ChatTest.Repo
  
    alias ChatTest.Schemas.User

    def create_new_user(attrs \\ %{}) do
        %User{}
        |> User.insert_changeset(attrs)
        |> Repo.insert(returning: true)
    end


    def update_user_details(%User{} = user ,attrs \\ %{}) do
        user
        |> User.update_changeset(attrs)
        |> Repo.update()
    end

    def change_password(%User{} = user , attrs) do
        user
        |> User.password_changeset(attrs)
        |> Repo.update()
    end
end