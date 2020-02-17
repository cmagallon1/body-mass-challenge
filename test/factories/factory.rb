require 'faker'

FactoryBot.define do 
  factory :user do
    name { Faker::Name.name_with_middle }
    sequence(:username) { |n| "#{Faker::Name.initials(number: 5)}#{n}" }
    password { Faker::Lorem.characters(number: 10)  }
  end
end


