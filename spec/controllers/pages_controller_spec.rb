require 'rails_helper'

RSpec.describe PagesController do

  describe '#landing' do
    it 'should respond succesfully' do
      get :landing
      expect(response).to be_success
    end
  end

end
