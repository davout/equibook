FactoryGirl.define do  
  factory :image do
  end

  factory :activity do
    horse
    user
    title         { Faker::Lorem.words(3) }
    description   { Faker::Lorem.words(20) }
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
