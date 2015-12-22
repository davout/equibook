require 'rails_helper'

RSpec.describe ImagesController do

  context 'with an existing user' do
    before { sign_in(@user = FactoryGirl.create(:user)) }

    describe 'POST #create' do
      it 'should create an image and return the link and ID in JSON' do
        expect { post(:create, format: :json, file: fixture_file_upload('spec/images/dummy.png', 'image/png')) }.
          to change { Image.count }.by(1)

        expect(response).to be_success
        expect(JSON.load(response.body)['id']).to eql(Image.last.id)
      end
    end

    context 'with an existing image' do
      before { @image = FactoryGirl.create(:image, user: @user) }

      describe 'GET #show' do
        it 'should return the link and ID in JSON' do
          get :show, format: :json, id: @image.id
          expect(response).to be_success
          expect(JSON.load(response.body)['id']).to eql(@image.id)
        end
      end
    end
  end
end

