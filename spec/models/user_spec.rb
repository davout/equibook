require 'rails_helper'

RSpec.describe User do

  describe '.from_omniauth' do
    it 'should create a user if none exists with the given e-mail' do
      expect do
        User.from_omniauth(RecursiveOpenStruct.new({
          provider: 'foo',
          uid:      (rand * 1000).to_i,
          info: {
            name:   Faker::Name.name,
            email:  Faker::Internet.email,
            image:  Faker::Lorem.word
          }
        }))
      end.to change { User.count }.by(1)
    end

    it 'should update a user if it already exists for a given e-mail' do
      email = Faker::Internet.email
      FactoryGirl.create(:user, email: email)

      expect do
        User.from_omniauth(RecursiveOpenStruct.new({
          provider: 'foo',
          uid:      (rand * 1000).to_i,
          info: {
            name:   Faker::Name.name,
            email:  email,
            image:  Faker::Lorem.word
          }
        }))
      end.to_not change { User.count }
    end
  end

end
