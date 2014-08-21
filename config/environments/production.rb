Rails.application.configure do
  ## Cache
  config.action_controller.perform_caching  = true
  config.cache_classes                      = true
  config.consider_all_requests_local        = false
  config.eager_load                         = true
  config.serve_static_assets                = false
  
  ## Assets
  config.assets.compile                     = false
  config.assets.digest                      = true
  config.assets.js_compressor               = :uglifier
  config.assets.version                     = '1.0'

  ## Errors & Logs
  config.active_support.deprecation         = :notify
  config.i18n.fallbacks                     = true
  config.log_formatter                      = ::Logger::Formatter.new
  config.log_level                          = :info

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
