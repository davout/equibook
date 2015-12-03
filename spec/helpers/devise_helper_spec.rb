require 'rails_helper'

RSpec.describe DeviseHelper do

  before do
    @resource = RecursiveOpenStruct.new({ errors: [] })
    expect(helper).to receive(:resource).once.and_return(@resource)
  end

  describe '#devise_error_messages!' do
    it 'should pass the resource to error_messages!' do
      expect(helper).to receive(:error_messages!).once.with(@resource)
      helper.devise_error_messages!
    end
  end

  describe '#devise_error_messages?' do
    it 'should test resource.errors emptyness' do
      expect(@resource.errors).to receive(:empty?).once
      helper.devise_error_messages?
    end
  end

end
