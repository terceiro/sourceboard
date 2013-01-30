require 'rspec'

SOURCE_BOARD_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

RUBY_PROGRAM = 'spec/data/language_detect/ruby'
RUBY_LIB = 'spec/data/language_detect/ruby.rb'

module SourceBoardSpecHelper
  def file(path)
    SourceBoard::SourceFile.new(SOURCE_BOARD_ROOT, path)
  end
end

RSpec.configure do |config|
  config.include SourceBoardSpecHelper
  config.color = true
end
