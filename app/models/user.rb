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
class User < ApplicationRecord
  # First Name is required
  validates :first_name, presence: true
  # Phone Number must be in the format: XXX.XXX.XXXX
  validates :phone, format:  { with: /\d{3,}\.\d{3,}\.\d{4,}/, message: "must be in the format xxx.xxx.xxxx" }

  # Email Address must be in a valid email format
  validates :email, format: { with: /\A\w+@([\w\d\-]+\.?)+[^\.]\z/, message: "e-mail must be in a valid format user@some.domain.com" }
end
