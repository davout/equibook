require 'rails_helper'

RSpec.describe Admin::UsersController do

  context 'with a signed-in admin' do
    before { sign_in FactoryGirl.create(:user, admin: true) }

    describe 'GET #index' do

      it 'should respond successfully' do
        get :index
        expect(response).to be_success
      end
    end
  end

end
