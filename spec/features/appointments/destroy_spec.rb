require 'spec_helper'
require 'rails_helper'
describe "Editing appointment" do
  let!(:appointment) { Appointment.create(title: "Groceries", description: "Grocery list.")}
  it "is succesful when clicking destroy link" do
  visit "/appointments"

  within "#appointment_#{appointment.id}" do
  	click_link "Destroy"
  end
	expect(page).to_not have_content(appointment.title)
	expect(Appointment.count).to eq(0)
	end
end