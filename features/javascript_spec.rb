require 'feature_helper'

describe 'SourceBoard Javascript', :type => 'feature', :js => true do

  it 'passses javascript tests' do
    visit '/assets/test.html'
    find('#qunit-testresult .failed').should have_content(/^0$/)
  end

end
