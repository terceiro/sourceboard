require 'spec_helper'
require 'source_board/parser/simple'

describe SourceBoard::Parser::Simple do

  before(:all) do
    @parser = SourceBoard::Parser::Simple.new
    tree = SourceBoard::SourceTree.new(SOURCE_BOARD_ROOT)
    data = @parser.parse!(tree)
    @itself = data.find { |e| e['path'] == 'lib/source_board/parser/simple.rb' }
    @python = data.find { |e| e['path'] == 'spec/data/language_detect/python' }
  end

  it 'finds itself' do
    @itself.should_not be_nil
  end

  it 'calculates lines of code' do
    @itself['metrics']['loc'].should > 0
  end

  it 'calculates number of methods' do
    @itself['metrics']['nom'].should > 0
  end

  it 'gets 0 methods for empty python file' do
    @python['metrics']['nom'].should == 0
  end

end
