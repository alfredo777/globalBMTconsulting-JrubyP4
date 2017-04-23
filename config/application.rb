require File.expand_path('../boot', __FILE__)

require 'rails/all'


ENV['ENV'] ||= 'development'

access_directory = __dir__

db_conf = YAML::load(File.open(File.join(access_directory,'database.yml')))
puts "Configuración de la base de datos *****>>>>> #{db_conf}"

$DB1_CONF = db_conf["systarget2015fruby"][ENV['ENV']]
$DB2_CONF = db_conf["operative"][ENV['ENV']]
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppJrubyP4
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false

  end
end
