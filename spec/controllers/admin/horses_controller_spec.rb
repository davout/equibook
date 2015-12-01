require 'rails_helper'

RSpec.describe Admin::HorsesController do

  render_views

  context 'with an existing horse' do
    before do
      user = FactoryGirl.create(:user, admin: true)
      FactoryGirl.create(:horse)
      sign_in(user)
    end

    describe '#index' do
      it 'should list horses' do
        get :index
        expect(response).to be_success
        expect(assigns(:records).count).to eql(1)
      end
    end
  end

end
