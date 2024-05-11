require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      create(:user,
        first_name: "First Name",
        middle: "Middle",
        last_name: "Last Name",
        address: "Address"
      ),
      create(:user,
        first_name: "First Name",
        middle: "Middle",
        last_name: "Last Name",
        address: "Address"
      )
    ])
  end

  it "renders a tabular list of users" do
    render
    cell_selector = 'table>tbody>tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("john@doe.dot.com"), count: 2
  end
end
