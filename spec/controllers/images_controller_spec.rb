require 'rails_helper'

RSpec.describe ImagesController do

  context 'with an existing user' do
    before { sign_in(@user = FactoryGirl.create(:user)) }

    describe 'POST #create' do
      it 'should create an image and return the link and ID in JSON' do
        expect { post(:create, file: fixture_file_upload('spec/images/dummy.png', 'image/png')) }.
          to change { Image.count }.by(1)

        expect(response).to be_success
        #byebug
        expect(JSON.load(response.body)['id']).to eql(Image.last.id)
        expect(JSON.load(response.body)['thumb']).to eql(Image.last.image.url(:thumb))
      end
    end

    context 'with an existing image' do
      before { @image = FactoryGirl.create(:image, user: @user) }

      describe 'GET #show' do
        it 'should return the link and ID in JSON' do
          get :show, id: @image.id
          expect(response).to be_success
          expect(JSON.load(response.body)['id']).to eql(@image.id)
          expect(JSON.load(response.body)['thumb']).to eql(@image.image.url(:thumb))
        end
      end

      describe 'GET #index' do
        it 'should return a JSON image collection' do
          get :index
          expect(response).to be_success
          expect(JSON.load(response.body).first['id']).to eql(@image.id)
          expect(JSON.load(response.body).first['thumb']).to eql(@image.image.url(:thumb))
        end
      end
    end
  end
end

