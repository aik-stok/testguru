require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Testguru
  class Application < Rails::Application

  config.time_zone = 'Minsk'
  I18n.config.enforce_available_locales = false
  I18n.default_locale = :ru
  end
end
