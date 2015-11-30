require 'rails_helper'

RSpec.describe HorsesController, type: :controller do

  before do
    Horse.create do |h|
      h.name = 'test'
      h.birth = Date.today
      h.height = 10
      h.color_id = 1
      h.gender_id = 1
    end
  end

  describe '#index' do
    it 'should list horses' do
      get :index
      expect(response).to be_success
      expect(assigns(:horses).count).to eql(1)
    end
  end

  describe '#create' do
  end

  describe '#destroy' do
  end

end
