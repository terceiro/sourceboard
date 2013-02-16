$: << File.dirname(File.realpath(__FILE__)) + '/../..'
require 'source_board/web/backend'

require 'sprockets'
require 'sass'
require 'coffee_script'

map '/assets' do
  root = File.join(File.dirname(File.realpath(__FILE__)) + '/assets')
  environment = Sprockets::Environment.new(root)
  environment.append_path 'bootstrap/css'
  environment.append_path 'bootstrap/js'
  environment.append_path 'bootstrap/jquery'
  environment.append_path 'js'
  environment.append_path 'css'
  unless ENV['RACK_ENV'] == 'production'
    environment.append_path 'test'
  end
  run environment
end

map '/' do
  run SourceBoard::Web::Backend
end
