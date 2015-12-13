require 'rails_helper'

RSpec.describe ActivitiesController do

  render_views

  context 'with an existing horse' do
    before do
      @user = FactoryGirl.build(:user)
      @activity = FactoryGirl.create(:activity)
      @user.horses << @activity.horse
      @user.save!
      sign_in(@user)
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

end

