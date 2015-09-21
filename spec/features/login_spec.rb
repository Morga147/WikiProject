require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Login Feature', type: :feature do
  it "works" do
    #checks to see root path works
    visit '/'
    #checks to see login link works
    click_link 'Log In'
    #checks if page title is what it's supposed to be
    expect(page.title).to eq 'Vernaculasaurus'
    
    # binding.pry drops you into a rails console after
    # the test is done running (well, drops you in wherever the
    # binding.pry is located in your test)
    # binding.pry
  end #end it "works"
end #end RSpec.describe
