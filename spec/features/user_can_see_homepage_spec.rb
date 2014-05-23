require 'spec_helper'

describe 'User can see a homepage' do

  it 'has the title Wine-OH!' do
    visit root_path
    expect(page).to have_content 'Wine-OH!'
  end

end
