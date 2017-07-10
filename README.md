# DuowebEx
Small Elixir wrapper for [erl_duoweb](https://github.com/bunnylushington/erl_duoweb)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `duoweb_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:duoweb_ex, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/duoweb_ex](https://hexdocs.pm/duoweb_ex).

## Configuration
[Generate an Application Secret Key >= 40 chars](https://duo.com/docs/duoweb?ikey=DI44F3KKTW5PK9UPC6HR&host=api-ec35e795.duosecurity.com#1.-generate-an-akey)
```elixir
:crypto.strong_rand_bytes(64) |> Base.encode64()
```
Can also be generated with `mix phx.gen.secret` in a Phoenix project



Should pull keys from a secret location, keep them from version control either way.

```elixir
# config.ex

config :duoweb_ex, 
    ikey: System.get_env("DUO_IKEY"),
    skey: System.get_env("DUO_SKEY"),
    akey: System.get_env("DUO_AKEY"),
    host: System.get_env("DUO_HOST")
```

## Examples
```elixir
unique_resp = DuowebEx.sign_request("someuserid")

case DuowebEx.verify_response(unique_resp) do
  {:ok, uid} -> uid
  error -> error
end
```


## TODO
- [] Phoenix Example