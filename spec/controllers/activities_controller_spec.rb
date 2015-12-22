require 'rails_helper'

RSpec.describe ActivitiesController do

  render_views

  context 'with a signed-in user' do
    before do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    context 'with an existing horse' do
      before do
        @activity = FactoryGirl.create(:activity)
        @user.horses << @activity.horse
      end

      describe 'GET #new' do
        it 'should respond successfully' do
          get :new, horse_id: @activity.horse.id
          expect(response).to be_success
        end
      end

      describe 'GET #index' do
        it 'should respond with all activities' do
          get :index, horse_id: @activity.horse.id
          expect(assigns(:activities).map(&:id)).to eql(@activity.horse.activities.map(&:id))
          expect(response).to be_success
        end
      end
    end

    context 'with a horse' do
      before { @horse = FactoryGirl.create(:horse, owner: @user) }

      describe 'POST #create' do
        it 'should create an activity and redirect to horse_activities_path' do
          expect { post :create, horse_id: @horse.id, activity: { title: 'Hello world', description: 'Hipster ipsum' } }.to change { Activity.count }.by(1)
          expect(response).to be_redirect
          expect(response.location).to eql(horse_activity_url(@horse, Activity.last))
        end
      end
    end

  end
end

