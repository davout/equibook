require 'rails_helper'

RSpec.describe Admin::ColorsController do

  describe '#index' do
    before do 
      FactoryGirl.create(:color)
      sign_in(FactoryGirl.create(:user, admin: true))
    end

    it 'should show the defined colors' do
      get :index
      expect(response).to be_success
      expect(assigns(:records).count).to eql(1)
    end
  end

end
