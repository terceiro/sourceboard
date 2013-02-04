require 'feature_helper'

describe 'SourceBoard', :type => 'feature', :js => true do

  it 'navigates between screens' do
    visit '/'
    find('#openproject').should be_visible

    find('.open-project').click
    find('#openproject').should_not be_visible
    find('#visualization').should be_visible

    find('.settings').click
    find("#settings").should be_visible
    find('#visualization').should_not be_visible

    find('.save-settings').click
    find('#settings').should_not be_visible
    find('#visualization').should be_visible

    find('.change-project').click
    find('#visualization').should_not be_visible
    find('#openproject').should be_visible
  end

end
