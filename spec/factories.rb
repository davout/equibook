FactoryGirl.define do  factory :activity do
    horse_id 1
user_id 1
start_at "2015-12-04 20:43:50"
end_at "2015-12-04 20:43:50"
title "MyString"
description "MyText"
  end
  

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
