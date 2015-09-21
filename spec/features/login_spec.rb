require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Login Feature', type: :feature do
  it "works" do
    visit '/'
    click_link 'Log In'
    # binding.pry drops you into a rails console after
    # the test is done running (well, drops you in wherever the
    # binding.pry is located in your test)
    binding.pry
  end #end it "works"
end #end RSpec.describe
