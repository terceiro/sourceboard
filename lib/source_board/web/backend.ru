require 'source_board/web/backend'
require 'sprockets'

map '/assets' do
  root = File.join(File.dirname(__FILE__) + '/assets')
  puts root
  environment = Sprockets::Environment.new(root)
  environment.append_path 'bootstrap/css'
  environment.append_path 'bootstrap/js'
  environment.append_path 'bootstrap/jquery'
  environment.append_path 'js'
  environment.append_path 'css'
  run environment
end

map '/' do
  run SourceBoard::Web::Backend
end
