require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      first_name: "First Name",
      middle: "Middle",
      last_name: "Last Name",
      phone: "Phone",
      email: "Email",
      address: "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Middle/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Address/)
  end
end
