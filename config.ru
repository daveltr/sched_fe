require "bundler/setup"
Bundler.require(:default)

require 'sprockets'
require File.expand_path('../app', __FILE__)

require 'handlebars_assets'

HandlebarsAssets::Config.ember = true
HandlebarsAssets::Config.path_prefix = 'javascripts/templates'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets'
  environment.append_path 'test' if (App.development? || App.test?)
  environment.append_path HandlebarsAssets.path
  run environment
end

run App
