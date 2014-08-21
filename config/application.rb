require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cineola
  class Application < Rails::Application
    config.encoding 	= "utf-8"
    config.time_zone 	= ENV['TIMEZONE']
    
    config.filter_parameters += [:password, :password_confirmation]
    config.assets.enabled = true
    config.assets.digest  = true
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.version = '1.0'
    
    config.i18n.default_locale  = :en
    config.i18n.load_path       += Dir[Rails.root.join('lib', 'locales', '*.{rb,yml}').to_s]
    config.autoload_paths       += Dir["#{config.root}/lib/"]
    
    config.i18n.available_locales = [:en, :es]
    
    config.domain = ENV['DOMAIN']
    config.action_controller.action_on_unpermitted_parameters = :log
    
    config.action_mailer.default_url_options = { host: ENV['DOMAIN'] }
    
    Rails.application.routes.default_url_options[:host] = ENV['DOMAIN']
    
    ## Paperclip Configuration
    config.paperclip_defaults = {
      storage: :s3,
      bucket: ENV['S3_BUCKET_NAME'],
      s3_credentials: {
      	access_key_id: ENV['S3_KEY'],
        secret_access_key: ENV['S3_SECRET']
    	},
    	s3_host_name: ENV['S3_HOST_NAME']
    }
  end
end
