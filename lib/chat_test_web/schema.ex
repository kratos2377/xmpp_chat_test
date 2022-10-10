defmodule ChatTestWeb.Schema do
    use Absinthe.Schema
    alias ChatTestWeb.Resolvers
    #import Types

    import_types(ChatTestWeb.Schema.Types)
  

    ## Reddit Part

    #Queries
        query do
            @desc "Just for testing" 
            field :test , :string do
                "Test passed"
            end
            #Users

            
            # end
        end
       
    #Mutations
        mutation do
            #User ones
           
            @desc "Login new user" 
            field :login, :user_type do
            arg(:input , non_null(:login_type))
            resolve(&Resolvers.UserResolver.login/3)
            end
          

            @desc "Register a new User"
            field :registeruser , :user_type do
            arg(:input , non_null(:register_input_type))
            resolve(&Resolvers.UserResolver.register_user/3)
            end

           
        end
        
end