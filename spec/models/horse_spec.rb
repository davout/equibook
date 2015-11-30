require 'rails_helper'

RSpec.describe Horse, type: :model do

  describe '#category' do
    before { @horse = Horse.new }

    it 'should return :unknown when size is not defined' do
      expect(@horse.category).to be(:unknown)
    end

    it 'should return the correct category for a given height' do
      @horse.height = 50
      expect(@horse.category).to be(:mini_poney)
    end
  end

end
