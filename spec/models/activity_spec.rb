require 'rails_helper'

RSpec.describe Activity do

  describe '#editable_by?' do
    before do
      @activity = FactoryGirl.build(:activity)
    end

    it 'should return true when the activity author is the same as the user parameter' do
      expect(@activity).to receive(:user).once.and_return(:foo)
      expect(@activity.editable_by?(:foo)).to be(true)
    end
  end

end

