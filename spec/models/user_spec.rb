require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  let(:valid_user) { described_class.new(first_name: "Bob")}

  describe "Validations >" do
    it "is invalid without a first_name" do
      expect {
        valid_user.first_name = nil
      }.to change { valid_user.valid? }.from(true).to(false)
    end
  end

end
