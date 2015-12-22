require 'rails_helper'

RSpec.describe HorsesController do

  context 'with an existing user' do
    before { sign_in(@user = FactoryGirl.create(:user)) }

    describe '#new' do
      it 'should respond successfully' do
        get :new
        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      it 'should create a horse' do
        expect do
          post :create, horse: {
            name: 'foo',
            color_id: FactoryGirl.create(:color).id,
            gender_id: FactoryGirl.create(:gender).id,
            birth: Date.today
          }

          expect(response).to be_redirect
          expect(response).to redirect_to(horse_path(Horse.last))
        end.to change { Horse.count }.by(1)
      end

      it 'should fail to create a horse with incorrect parameters' do
        expect do
          post :create, horse: { name: '' }
          expect(response).to be_success
          expect(assigns(:horse).errors).to_not be_empty
        end.to_not change { Horse.count }
      end
    end

    context 'with an existing horse' do
      before { @horse = FactoryGirl.create(:horse, owner: @user) }

      describe 'GET #index' do
        it 'should list horses' do
          get :index
          expect(response).to be_success
          expect(assigns(:horses).count).to eql(1)
        end
      end

      describe 'GET #show' do 
        it 'should show the details of a horse' do
          get :show, id: @horse.id
          expect(response).to be_success
        end
      end

      describe 'GET #edit' do
        it 'should respond with the edition form' do
          get :edit, id: @horse.id
          expect(response).to be_success
        end
      end

      describe 'DELETE #destroy' do
        it 'should delete one\'s own horse' do
          expect { delete :destroy, id: @user.horses.first.id }.to change { Horse.count }.by(-1)
        end
      end

      describe 'PUT #update' do
        it 'should update a horse' do
          put :update, id: @horse.id, horse: { name: 'miaou' }
          expect(response).to be_redirect
          expect(response).to redirect_to(horse_path(@horse))
          expect(@horse.reload.name).to eql('miaou')
        end

        it 'should refuse to incorrectly update a horse' do
          put :update, id: @horse.id, horse: { name: nil }
          expect(response).to be_success
          expect(assigns(:horse).errors).to_not be_empty
        end
      end
    end

  end

end
