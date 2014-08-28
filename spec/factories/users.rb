FactoryGirl.define do
  factory :user do
    email 'wiggle@lego.com'
    password '12345678'
    password_confirmation '12345678'
    admin false
  end

  factory :admin, class: User do
  	email 'hanwax@lego.com'
  	password '1234567890'
  	password_confirmation '1234567890'
  	admin true
  end
end