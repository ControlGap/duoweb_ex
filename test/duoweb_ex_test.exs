defmodule DuowebExTest do
  use ExUnit.Case
  doctest DuowebEx

  @bad_a_key_len "Application Secrety Key (akey) must be >= 40 characters"

  test "should result in :error tuple" do
    assert DuowebEx.sign_request("", "", "", "") == {:error, @bad_a_key_len}
  end
end
