FactoryGirl.define do

  factory :image do
    image         { fixture_file_upload('spec/images/dummy.png', 'image/png') }
    user
  end

  factory :activity do
    horse
    user
    title         { Faker::Hipster.sentence(3) }
    description   { Faker::Lorem.sentence(20, false, 0) }
  end


  factory :gender do
    name          { Faker::Hipster.word }
  end

  factory :color do
    name          { Faker::Hipster.word }
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
