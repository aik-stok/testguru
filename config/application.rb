require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Testguru
  class Application < Rails::Application

  config.time_zone = 'Minsk'
  config.i18n.default_locale = :ru
  
   config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
