require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      first_name: "MyString",
      middle: "MyString",
      last_name: "MyString",
      phone: "MyString",
      email: "MyString",
      address: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[middle]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[phone]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[address]"
    end
  end
end
