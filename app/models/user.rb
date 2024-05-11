class User < ApplicationRecord
  # First Name is required
  validates :first_name, presence: true
  # Phone Number must be in the format: XXX.XXX.XXXX
  # Email Address must be in a valid email format
end
