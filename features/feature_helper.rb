require 'capybara/rspec'
require 'source_board/web/backend'

config = File.join(File.dirname(__FILE__), '..', 'config.ru')
Capybara.app = Rack::Builder.parse_file(config).first
