require 'rails_helper'

RSpec.describe ActivitiesController do

  context 'with a signed-in user' do
    before do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    context 'with an existing horse' do
      before { @horse = FactoryGirl.create(:horse, owner: @user) }

      describe 'GET #new' do
        it 'should respond successfully' do
          get :new, horse_id: @horse.id
          expect(response).to be_success
        end
      end

      describe 'POST #create' do
        it 'should create an activity and redirect to horse_activities_path' do
          expect { post :create, horse_id: @horse.id, activity: { title: 'Hello world', description: 'Hipster ipsum' } }.to change { Activity.count }.by(1)
          expect(response).to be_redirect
          expect(response.location).to eql(horse_activity_url(@horse, Activity.last))
        end
      end

      context 'with an existing activity' do
        before { @activity = FactoryGirl.create(:activity, horse: @horse) }

        describe 'GET #index' do
          it 'should respond with all activities' do
            get :index, horse_id: @activity.horse.id
            expect(assigns(:activities).map(&:id)).to eql(@activity.horse.activities.map(&:id))
            expect(response).to be_success
          end
        end

        describe 'GET #show' do
          it 'should show the activity details' do
            get :show, id: @activity.id, horse_id: @horse.id
            expect(response).to be_success
          end
        end

        describe 'GET #edit' do
          it 'should show the activity edition form' do
            get :edit, id: @activity.id, horse_id: @horse.id
            expect(response).to be_success
          end
        end

        describe 'PUT #update' do
          it 'should update the activity' do
            put :update, id: @activity.id, horse_id: @horse.id, activity: {
              title: 'foobar'
            }

            expect(@activity.reload.title).to eql('foobar')
            expect(response).to be_redirect
            expect(response).to redirect_to(horse_activity_path(@horse, @activity))
          end
        end

        describe 'DELETE #destroy' do
          it 'should delete the activity' do
            expect { delete(:destroy, id: @activity.id, horse_id: @horse.id) }.
              to change { Activity.count }.by(-1)

            expect(response).to be_redirect
            expect(response).to redirect_to(horse_activities_path(@horse))
          end
        end
      end


    end

  end
end

