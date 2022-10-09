defmodule ChatTestWeb.Resolvers.UserResolver do
    import Ecto.Query, warn: false
    alias ChatTest.Repo
  
    alias ChatTest.Schemas.User



    def allUsers(_,_,_) do
        {:ok , Repo.all(User)}
    end

    #Implement how to send email and verify email
   


    

    def login(_ , %{input: input} , _ ) do
        user = from(u in User ,  where: u.email == ^input.email) |> Repo.one()
  
        if is_nil(user) do
            {:error , "email is invalid"}
        else
            if Pbkdf2.verify_pass(input.password , user.password) do
                {:ok , %{id: user.id , first_name: user.first_name , last_name: user.last_name, email: user.email, username: user.username,  token: Token.generate_and_sign!(%{"user_id" => user.id})}}
            else
                {:error , "password invalid"}
             
            end
        end
    end
    
    def register_user(_, %{input: input} , _) do
       case UserQuery.is_email_verified(input) do
        {:ok , message} -> if message == "email not in use" do
            {:error, "email not in table"}
        else
            case UserMutation.create_new_user(input) do
                {:ok , user} -> {:ok , %{id: user.id , first_name: user.first_name , last_name: user.last_name, email: user.email, username: user.username,  token: Token.generate_and_sign!(%{"user_id" => user.id})}}
                _ -> {:error , "some error occured"}
            end
        end
            
          

           _ -> {:error , "Email not verified"}
        end
    end


end