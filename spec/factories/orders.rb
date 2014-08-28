# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    order_number 123456789
    created_at "2014-08-27 10:45:33"
  end
end
