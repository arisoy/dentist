require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        :title => "Title",
        :description => "MyText"
      ),
      Appointment.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
