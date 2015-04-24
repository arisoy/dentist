require 'spec_helper'
require 'rails_helper'

describe "creating appointments" do 
  it "redirects to the appointments index page on success" do
    visit "/appointments"
    click_link "New Appointment"
    expect(page).to have_content("New Appointment")
  end
end
