require 'spec_helper'
require 'source_board/source_tree'

describe SourceBoard::SourceTree do

  before(:all) do
    @directory = SOURCE_BOARD_ROOT + '/spec/data'
    @tree = SourceBoard::SourceTree.new(@directory)
  end

  it 'stores directory' do
    @tree.directory.should == @directory
  end

  it 'detects files' do
    @tree.files.length.should > 0
  end

  it 'offer file-name based access' do
    @tree['language_detect/ruby.rb'].should_not be_nil
  end

  it 'ignores directories' do
    @tree['language_detect'].should be_nil
  end

  it 'detects mime types' do
    @tree['language_detect/ruby'].mime_type.should == 'text/x-ruby'
  end

  it 'calculates a language breakdown' do
    @tree.language_breakdown['ruby'].should > 0
    @tree.language_breakdown['python'].should > 0
  end


end
