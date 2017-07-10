defmodule DuowebEx do

  @bad_a_key_len "Application Secrety Key (akey) must be >= 40 characters"

  @doc """
  Manually pass in all parameters
  """
  def sign_request(ikey, skey, akey, uid) when length(akey) >= 40 do
    :duoweb.sign_request(to_charlist(ikey), to_charlist(skey), to_charlist(akey), to_charlist(uid) )
    |> to_string()       
  end

  def sign_request(_, _, _, _)  do
      {:error,  @bad_a_key_len}     
  end

  @doc """
  Pulls ikey, skey, and akey from applicatoin configuration
  """
  def sign_request(uid) do
    ikey = Application.get_env(:duoweb_ex, :ikey)
    skey = Application.get_env(:duoweb_ex, :skey)
    akey = Application.get_env(:duoweb_ex, :akey)

    sign_request(ikey, skey, akey, uid)
  end


  def verify_response(ikey, skey, akey, duo_resp) when length(akey) >= 40 do
    valid_resp? = :duoweb.verify_response(to_charlist(ikey), to_charlist(skey), to_charlist(akey), to_charlist(duo_resp) )
    case valid_resp? do
      [] -> {:error, "Invalid"}
      uid -> {:ok, to_string(uid) }
    end
  end

  def verify_response(_, _, _, _)  do
      {:error,  @bad_a_key_len}
  end

  @doc """
  Pulls ikey, skey, and akey from application configuration
  """
  def verify_response(duo_resp) do
    ikey = Application.get_env(:duoweb_ex, :ikey)
    skey = Application.get_env(:duoweb_ex, :skey)
    akey = Application.get_env(:duoweb_ex, :akey)

    verify_response(ikey, skey, akey, duo_resp)
  end

end
