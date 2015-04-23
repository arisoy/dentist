require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do

      assert_select "input#appointment_title[name=?]", "appointment[title]"

      assert_select "textarea#appointment_description[name=?]", "appointment[description]"
    end
  end
end
