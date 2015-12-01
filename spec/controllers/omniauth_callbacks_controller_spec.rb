require 'rails_helper'

RSpec.describe OmniauthCallbacksController do

 before(:each) { @request.env["devise.mapping"] = Devise.mappings[:user] }

  describe 'POST #facebook' do
    it 'should redirect to the signup if the user cannot be saved' do
      allow(User).to receive(:from_omniauth).and_return(FactoryGirl.build(:user))
      post :facebook
      expect(response).to redirect_to(new_user_registration_url)
    end

    it 'should sign in and redirect the user if it is saved' do
      allow(User).to receive(:from_omniauth).and_return(FactoryGirl.create(:user))
      post :facebook
      expect(response).to redirect_to(horses_path)
    end
  end

end
