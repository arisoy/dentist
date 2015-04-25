require 'spec_helper'
require 'rails_helper'
describe "Editing appointment" do
  let!(:appointment) { Appointment.create(title: "Groceries", description: "Grocery list.")}

  def update_appointment(options={})
    options[:title] ||= "My appointment"
    options[:description] ||= "This is my appointment."
    appointment = options[:appointment]

    visit "/appointments"
    within "#appointment_#{appointment.id}" do
      click_link "Edit"
    end
        
    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Appointment"
  end
  
  it "updates an appointment with correct information" do
    update_appointment appointment: appointment, 
                       title: "New title", 
                       description: "New description"

    appointment.reload
    
    expect(page).to have_content("Appointment was successfully updated.")
    expect(appointment.title).to eq("New title")
    expect(appointment.description).to eq("New description")
 end

it "displays an error with no title" do
    update_appointment appointment: appointment, title: ""
    title = appointment.title
    appointment.reload
    expect(appointment.title).to eq(title)
    expect(page).to have_content("error")


    title = appointment.title
    appointment.reload
    expect(appointment.title).to eq(title)
    expect(page).to have_content("error")
  end

  it "displays an error with too short a title" do
    update_appointment appointment: appointment, title: "hi"
    expect(page).to have_content("error")
  end

  it "displays an error with no description" do
    update_appointment appointment: appointment, description: ""
    expect(page).to have_content("error")
  end

  it "displays an error with too short a description" do
    update_appointment appointment: appointment, description: "hi"
    expect(page).to have_content("error")
  end




end