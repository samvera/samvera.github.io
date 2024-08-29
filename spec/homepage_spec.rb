require 'spec_helper'

describe 'homepage', type: :feature, js: true do
  it 'is accessible' do
    visit '/'
    expect(find('h1.page-header').text).to match(/This site has been sunset/)
  end
end
