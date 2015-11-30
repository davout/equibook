require 'rails_helper'

RSpec.describe HorsesController, type: :controller do

  context 'with an existing horse' do
    before do
      @user = FactoryGirl.build(:user)
      @user.horses << FactoryGirl.create(:horse)
      @user.save!
      sign_in(@user)
    end

    describe '#index' do
      it 'should list horses' do
        get :index
        expect(response).to be_success
        expect(assigns(:horses).count).to eql(1)
      end
    end

    describe '#destroy' do
      it 'should delete one\'s own horse' do
        expect { delete :destroy, id: @user.horses.first.id }.to change { Horse.count }.by(-1)
      end
    end
  end


  describe '#create' do
  end

end
