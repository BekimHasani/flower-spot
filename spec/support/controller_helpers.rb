def user_login(payload, exp = 7.days.from_now)
  secret_key = Rails.application.secret_key_base
  payload[:exp] = exp.to_i

  request.headers["Authorization"] =
    JWT.encode(payload, secret_key)
end
