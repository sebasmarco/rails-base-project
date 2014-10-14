source 'https://rubygems.org'

ruby "2.1.2"

gem 'rails', '4.1.6'

## Amazon S3 y Imagenes
gem 'aws-s3', :require => 'aws/s3'              # Conexion con amazon. https://github.com/marcel/aws-s3
gem 'aws-sdk', '~> 1.0', :require => false      # Conexion con amazon. https://github.com/aws/aws-sdk-ruby
gem "paperclip", "~> 4.2"                       # Almacenar imagenes. https://github.com/thoughtbot/paperclip

## Autenticacion & Autorizacion
gem 'authlogic'                                 # Autenticacion de Modelo. https://github.com/binarylogic/authlogic
gem 'scrypt'

## Bases de Datos
gem 'pg'                                        # BD PostgreSQL. https://bitbucket.org/ged/ruby-pg/wiki/Home

## Correos Electronicos
gem 'mail_gate'                                 # Restringe envio de correos. https://github.com/dewski/mail_gate
gem "mail_view"                                 # Previsualizar correos. https://github.com/37signals/mail_view
gem 'roadie'                                    # Estilos en correos. https://github.com/Mange/roadie
gem 'roadie-rails'

## CSS
gem 'bootstrap-sass', '~> 3.2.0'
gem 'font-awesome-rails'
gem 'sass-rails', '~> 4.0.3'                    # SCSS para stylesheets
gem 'heroku-deflater', :group => :production

## Javascript
gem 'coffee-rails', '~> 4.0.0'    # CoffeeScript para .js.coffee
gem 'eco'                         # Templates JS con Eco. 
gem 'gon'                         # Enviar datos desde un controlador a javascript. https://github.com/gazay/gon
gem 'google-analytics-turbolinks' # Google Analytics with Turbolinks
gem 'jquery-rails'                # JQuery como libreria de JavaScript
gem 'jquery-fileupload-rails'     # JQuery file upload.
gem 'turbolinks'                  # Hace vinculos en el sitio mas rapido. https://github.com/rails/turbolinks
gem 'turbolinks_transitions'      # Agregar transiciones a turbolinks. https://github.com/caarlos0/turbolinks_transitions
gem 'turboboost'                  # Turbolinks para formularios. https://github.com/waymondo/turboboost
gem 'uglifier', '>= 1.3.0'        # Comprimer js

## JSON
gem 'oj', :require => false       # JSON optimizado. https://github.com/ohler55/oj
gem 'rabl'                        # Templates para JSON, XML, etc. https://github.com/nesquena/rabl

## Patrones de Diseno
gem 'draper'                      # Decoradores para Modelos. https://github.com/drapergem/draper

## Servidores
gem 'rails_12factor', :group => :production  # Logs Visible en Heroku. https://devcenter.heroku.com/articles/rails-integration-gems
gem 'unicorn'                                # Utiliza Unicorn como servidor de aplicacion. http://unicorn.bogomips.org/

## Traduccion
gem 'it'                          # Traducciones. http://rubygems.org/gems/it
gem 'rails-i18n', '~> 4.0.0.pre'  # Datos de Localidades. https://github.com/svenfuchs/rails-i18n

## Vistas
gem 'kaminari'                    # Paginacion. https://github.com/amatsuda/kaminari
gem 'unicode_utils'               # Algoritmos Unicode Ruby. https://github.com/lang/unicode_utils

## Otro
gem 'hirb'                        # Ver tablas en Hirb. https://github.com/cldwalker/hirb
gem 'friendly_id'                 # URLs mas amigables. https://github.com/norman/friendly_id
gem 'spring'

group :doc do
  gem 'sdoc', :require => false
  gem 'rocco', :git => "git://github.com/rtomayko/rocco.git"
end

group :development, :test do
  gem 'annotate',           :require => false
  gem 'better_errors'
  gem 'binding_of_caller',  :require => false
  gem 'bullet'
  gem 'factory_girl_rails'
  gem 'hirb-unicode'
  gem 'meta_request'
  gem 'quiet_assets'
  gem 'rspec-rails'
end

group :test do 
  gem 'capybara',         :require => false
  gem 'cucumber-rails',   :require => false
  gem 'database_cleaner', :require => false
  gem 'email_spec',       :require => false
  gem 'launchy'
end

## foreman start -f Procfile.development
## annotate --exclude tests,fixtures,factories