FactoryGirl.define do
  factory :user do
    email { 'test@ryanbosinger.com' }
    password "password"
    password_confirmation "password"
  end
end
