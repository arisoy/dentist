require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "input#appointment_title[name=?]", "appointment[title]"

      assert_select "textarea#appointment_description[name=?]", "appointment[description]"
    end
  end
end
