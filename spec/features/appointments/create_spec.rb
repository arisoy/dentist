require 'spec_helper'
require 'rails_helper'

describe "creating appointments" do 
  it "redirects to the appointments index page on success" do
    visit "/appointments"
    click_link "New Appointment"
    expect(page).to have_content("New Appointment")
    
    fill_in "Title", with: "My Appointment"
    fill_in "Description", with: "Dişimi çek la!!!"
    click_button "Create Appointment"
    
    expect(page).to have_content("My Appointment")
    
  end

  it "displays an error when the appointment has no title" do
    expect(Appointment.count).to eq(0)
    
    visit "/appointments"
    click_link "New Appointment"
    expect(page).to have_content("New Appointment")
    
    fill_in "Title", with: ""
    fill_in "Description", with: "Dişimi çek la!!!"
    click_button "Create Appointment"
    
    expect(page).to have_content("error")
    expect(Appointment.count).to eq(0)
    
    visit "/appointments"
    expect(page).to have_content("Listing Appointments Title Description New Appointment")
  end
    
  it "displays an error when the appointment has a title less than 3 characters" do
    expect(Appointment.count).to eq(0)
    
    visit "/appointments"
    click_link "New Appointment"
    expect(page).to have_content("New Appointment")
    
    fill_in "Title", with: "Hi"
    fill_in "Description", with: "Dişimi çek la!!!"
    click_button "Create Appointment"
    
    expect(page).to have_content("error")
    expect(Appointment.count).to eq(0)
    
    visit "/appointments"
    expect(page).to have_content("Listing Appointments Title Description New Appointment")
  end
    
end
