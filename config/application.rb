require_relative 'boot'

require 'rails/all'

require 'carrierwave'
require 'carrierwave/orm/activerecord'

Bundler.require(*Rails.groups)

module RailsTest
  class Application < Rails::Application
    config.load_defaults 5.1
  end
end
