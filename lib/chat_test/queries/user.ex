defmodule ChatTest.Queries.User do
    import Ecto.Query, warn: false
    alias ChatTest.Repo
  
    alias ChatTest.Schemas.User

    def list_users do
        Repo.all(User)
    end

    def user_by_id!(id) do
        Repo.get(User , id)
      end
      
      def returnUser(%{"email" => email} = params) do
        user = from(u in User, where: u.email == ^email) |> Repo.one()
      
        user
      
      end




end