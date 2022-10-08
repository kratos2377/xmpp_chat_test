defmodule ChatTest.Repo do
  use Ecto.Repo,
    otp_app: :chat_test,
    adapter: Ecto.Adapters.Postgres
end
