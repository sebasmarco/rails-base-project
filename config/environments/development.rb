Rails.application.configure do
  config.action_controller.perform_caching          = false
  config.active_support.deprecation                 = :log
  config.active_record.migration_error              = :page_load
  config.action_view.raise_on_missing_translations  = true
  
  # Assets
  config.assets.debug = true
  config.assets.raise_runtime_errors = true
  
  ## Cache
  config.cache_classes                              = false
  config.consider_all_requests_local                = true
  config.eager_load                                 = false
  
  ## Mail Settings
  config.action_mailer.raise_delivery_errors        = false
  config.action_mailer.perform_deliveries           = false
  config.action_mailer.default_url_options          = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method              = :mail_gate
  
  config.action_mailer.mail_gate_settings = { 
    whitelist:         /gitz.cl|jzumaran86@gmail.com/,
    subject_prefix:    "[GIZ DEVELOPMENT]",
    delivery_method:   :smtp,
    delivery_settings: {
      user_name:            ENV["SENDGRID_USER_NAME"],
      password:             ENV["SENDGRID_PASSWORD"],
      domain:               ENV["SENDGRID_DOMAIN"],
      address:              ENV["SENDGRID_ADDRESS"],
      port:                 ENV["SENDGRID_PORT"],
      authentication:       :plain,
      enable_starttls_auto: true
    }
  }
  
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  
  ## Logger
  config.logger       = Logger.new(STDOUT)
  config.logger.level = Logger.const_get('DEBUG')
end
