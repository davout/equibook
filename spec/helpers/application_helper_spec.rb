require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#error_messages!' do
    before { @horse = Horse.new; @horse.valid? }

    it 'should output HTML including error messages for a given resource' do
      expect(helper.error_messages!(@horse)).to match(/>Nom doit être rempli/)
    end
  end

end
