require 'spec_helper'
require 'source_board/parser'

describe SourceBoard::Parser do

  before(:all) do
    @parser = SourceBoard::Parser.new
  end

  it 'must indicate that at least loc and number_of_definitions are supported' do
    @parser.metrics.should include(:loc)
    @parser.metrics.should include(:number_of_definitions)
  end

  it 'accepts any language by default' do
    @parser.should be_accept(:whatever)
  end

end
