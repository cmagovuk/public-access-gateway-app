module CookiesHelper
  def cookie_settings
    JSON.parse cookies.fetch("cookie_setting", '{"essential": true, "analytics": false, "confirmed": false}')
  end

  def cookie_form
    @cookie_form ||= CookieForm.new(cookie_settings)
  end
end
