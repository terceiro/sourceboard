require 'spec_helper'
require 'source_board/parser/simple'

describe SourceBoard::Parser::Simple do

  before(:all) do
    @parser = SourceBoard::Parser::Simple.new
    tree = SourceBoard::SourceTree.new(SOURCE_BOARD_ROOT)
    data = @parser.parse!(tree)
    @itself = data.find { |e| e['id'] == 'lib/source_board/parser/simple.rb' }
  end

  it 'finds itself' do
    @itself.should_not be_nil
  end

  it 'calculates LOC' do
    @itself['metrics']['loc'] > 0
  end

  it 'calculates number of definitions' do
    @itself['metrics']['number_of_definitions'] > 0
  end

end
