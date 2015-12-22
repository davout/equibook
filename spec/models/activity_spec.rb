require 'rails_helper'

RSpec.describe Activity do

  context 'with an unsaved activity' do
    before { @activity = FactoryGirl.build(:activity) }

    describe '#editable_by?' do
      it 'should return true when the activity author is the same as the user parameter' do
        expect(@activity).to receive(:user).once.and_return(:foo)
        expect(@activity.editable_by?(:foo)).to be(true)
      end
    end

    describe '#description' do
      it 'should preserve src attributes in img tags' do
        @activity.description = '<img src="http://example.com/image.png" foo="bar">'
        expect(@activity.description).to eql('<img src="http://example.com/image.png">')
      end
    end

    describe '#summary' do
      it 'should properly (not) sanitize a short string' do
        expect(@activity.summary).to_not match(/\.\.\./)
      end

      it 'should properly sanitize a long string' do
        @activity.description = "<span>FooBar</span> " + Faker::Hipster.sentence(30)
        expect(@activity.summary).to match(/^FooBar/)
        expect(@activity.summary).to match(/\.\.\./)
        expect(@activity.summary.split(' ').count).to eql(20)
      end
    end

  end
end

