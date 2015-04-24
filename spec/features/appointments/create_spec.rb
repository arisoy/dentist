require 'spec_helper'
require 'rails_helper'

describe "Creating appointment" do
  def create_appointment(options={})
    options[:title] ||= "My appointment"
    options[:description] ||= "This is my appointment."

    visit "/appointments"
    click_link "New Appointment"
    expect(page).to have_content("New Appointment")

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Create Appointment"
  end

  it "redirects to the appointment index page on success" do
    create_appointment
    expect(page).to have_content("My appointment")
  end

  it "displays an error when the todo list has no title" do
    expect(Appointment.count).to eq(0)

    create_appointment title: ""

    expect(page).to have_content("error")
    expect(Appointment.count).to eq(0)

    visit "/appointments"
    expect(page).to_not have_content("This is my appointment.")
  end

  it "displays an error when the todo list has a title less than 3 characters" do
    expect(Appointment.count).to eq(0)

    create_appointment title: "Hi"

    expect(page).to have_content("error")
    expect(Appointment.count).to eq(0)

    visit "/appointments"
    expect(page).to_not have_content("This is my appointment.")
  end

  it "displays an error when the appointment has no description" do
    expect(Appointment.count).to eq(0)

    create_appointment title: "Grocery list", description: ""

    expect(page).to have_content("error")
    expect(Appointment.count).to eq(0)

    visit "/appointments"
    expect(page).to_not have_content("Grocery list")
  end

  it "displays an error when the todo list has no description" do
    expect(Appointment.count).to eq(0)

    create_appointment title: "Grocery list", description: "Food"

    expect(page).to have_content("error")
    expect(Appointment.count).to eq(0)

    visit "/appointments"
    expect(page).to_not have_content("Grocery list")
  end
end