require 'rails_helper'
require 'factory_girl'

RSpec.describe Shorten, type: :model do

    it 'should contain a valid url' do
        shorten = FactoryGirl.build(:shorten)
        expect(shorten).to be_valid

        shorten = FactoryGirl.build(:invalid_url_shorten)
        expect(shorten).to be_invalid
    end

end
