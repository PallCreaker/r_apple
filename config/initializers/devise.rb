# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
    config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
    require 'devise/orm/active_record'
    config.case_insensitive_keys = [ :email ]
    config.strip_whitespace_keys = [ :email ]
    config.skip_session_storage = [:http_auth]
    config.stretches = Rails.env.test? ? 1 : 10
    config.reconfirmable = true
    config.expire_all_remember_me_on_sign_out = true
    config.password_length = 4..10
    config.reset_password_within = 6.hours
    config.sign_out_via = :delete
	config.scoped_views = true

	#API key
#	  if Rails.env.production?     
#		  config.omniauth :facebook, "1565244200363131", "bbfdf229a7145bfa0c9f7c2906f52bdf"
#	  else
#		  config.omniauth :facebook, "1565244200363131", "bbfdf229a7145bfa0c9f7c2906f52bdf"
#	  end
	config.omniauth :facebook, "1565244200363131", "bbfdf229a7145bfa0c9f7c2906f52bdf"

  end
