require 'spec_helper'
require 'source_board/source_file'

describe SourceBoard::SourceFile do

  it 'stores its path' do
    file(RUBY_LIB).path.should == RUBY_LIB
  end

  it 'stores its full path' do
    file = SourceBoard::SourceFile.new(SOURCE_BOARD_ROOT, RUBY_LIB)
    Dir.chdir(Dir.home) do
      File.exists?(file.full_path).should == true
    end
  end

  it 'has an extension' do
    file(RUBY_LIB).extension.should == 'rb'
  end

  it 'can be executable' do
    file(RUBY_PROGRAM).should be_executable
  end

  it 'stores a mime_type is passed in' do
    f = file('spec/spec_helper.rb')
    f.mime_type = 'text/foo'
    f.mime_type.should == 'text/foo'
  end

  it 'compares with itself' do
    file('spec/spec_helper.rb').should == file('spec/spec_helper.rb')
  end

  it 'has a language' do
    file('spec/spec_helper.rb').language.name.should == 'ruby'
  end

end
