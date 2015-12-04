FactoryGirl.define do  

  factory :gender do
    name          { Faker::Lorem.word }
  end

  factory :color do
    name          { Faker::Lorem.word }
  end

  factory :user do
    email         { Faker::Internet.email }
    password      'password'
  end

  factory :horse do
    name          { Faker::Name.name }
    nick          { Faker::Name.first_name }
    height        50
    birth         { Date.today }
    owner         factory: :user
    color
    gender
  end

end
