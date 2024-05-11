# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  address    :string
#  email      :string
#  first_name :string
#  last_name  :string
#  middle     :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  let(:valid_user) { described_class.new(first_name: "Bob", phone: "123.456.7890", email: "bob@bobness.com") }

  it "has a valid example" do
    expect(valid_user).to be_valid
  end

  describe "Validations >" do
    it "is invalid without a first_name" do
      expect {
        valid_user.first_name = nil
      }.to change { valid_user.valid? }.from(true).to(false)
    end

    describe "phone >" do
      it "is invalid without a phone" do
        expect {
          valid_user.phone = nil
        }.to change { valid_user.valid? }.from(true).to(false)
      end

      it "is invalid if the phone number isn't period separated" do
        expect {
          valid_user.phone = "1234567890"
        }.to change { valid_user.valid? }.from(true).to(false)
      end

      it "is invalid if the phone number is formatted with () and -" do
        expect {
          valid_user.phone = "(123) 456-7890"
        }.to change { valid_user.valid? }.from(true).to(false)
      end
    end

    describe "email >" do
      it "is invalid without an email" do
        expect {
          valid_user.email = nil
        }.to change { valid_user.valid? }.from(true).to(false)
      end

      it "is invalid if the email is just a string" do
        expect {
          valid_user.email = "this is not an email"
        }.to change { valid_user.valid? }.from(true).to(false)
      end

      it "is invalid if the email has too many @s" do
        expect {
          valid_user.email = "foo@foo@foo.com"
        }.to change { valid_user.valid? }.from(true).to(false)
      end

      it "allows for emails with three domain segments" do
        expect {
          valid_user.email = "foo@domain.co.uk"
        }.not_to change { valid_user.valid? }.from(true)
      end
    end
  end

end
