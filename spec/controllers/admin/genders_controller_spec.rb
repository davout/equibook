require 'rails_helper'

RSpec.describe Admin::GendersController do

  describe '#index' do
    before do 
      FactoryGirl.create(:gender)
      sign_in(FactoryGirl.create(:user, admin: true))
    end

    it 'should show the defined genders' do
      get :index
      expect(response).to be_success
      expect(assigns(:records).count).to eql(1)
    end
  end

end
