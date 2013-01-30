require 'spec_helper'
require 'source_board/source_tree'
require 'source_board/source_file'
require 'source_board/language'

describe SourceBoard::Language do

  before(:all) do
    @tree = SourceBoard::SourceTree.new(SOURCE_BOARD_ROOT + '/' + 'spec/data/language_detect')
  end

  it 'detects by extension' do
    lang = SourceBoard::Language.new('foo')
    lang.extensions = 'foo'
    lang.should be_detect(file('bli.foo'))
  end

  it 'detects by mime type' do
    lang = SourceBoard::Language.new('foo')
    lang.mime_type = 'text/foo'
    file = SourceBoard::SourceFile.new('/path/to/project', 'FILE')
    file.mime_type = 'text/foo'
    lang.should be_detect(file)
  end

  Dir.glob(SOURCE_BOARD_ROOT + '/' + 'spec/data/language_detect/*').each do |f|
    filename = File.basename(f)
    it "should detect #{filename}" do
      file = @tree[filename]
      language =  filename.gsub(/\.[a-z]*$/, '').split('_').first
      SourceBoard::Language.detect(file).name.should == language
    end

  end

end
