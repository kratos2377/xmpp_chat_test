defmodule ChatTestWeb.Schema.Types do
    use Absinthe.Schema.Notation
   
    alias ChatTestWeb.Schema.Types
   

    import_types(Types.Usertype)
   end