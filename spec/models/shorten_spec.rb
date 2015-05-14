require 'rails_helper'
require 'factory_girl'

RSpec.describe Shorten, type: :model do

    it 'should contain a valid url' do
        shorten = FactoryGirl.create(:shorten)
        expect(shorten).to be_valid
    end

end
