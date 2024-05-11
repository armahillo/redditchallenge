# User+
#  address    :string
#  email      :string
#  first_name :string
#  last_name  :string
#  middle     :string
#  phone      :string

FactoryBot.define do
  factory :user do
    first_name { "John" }
    middle { "Q" }
    last_name  { "Doe" }
    phone { "123.456.6789" }
    email { "john@doe.dot.com" }
    address { "123 John Street" }
  end
end