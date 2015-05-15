require 'rails_helper'
require 'factory_girl'

RSpec.describe Shorten, type: :model do

    it 'should contain a valid url' do
        shorten = FactoryGirl.build(:shorten)
        expect(shorten).to be_valid

        shorten = FactoryGirl.build(:invalid_url_shorten)
        expect(shorten).to be_invalid
    end

    it 'should auto-generate a shortcode if none is requested' do
        shorten = FactoryGirl.create(:no_shortcode_shorten)

        expect(shorten).to be_valid
        expect(shorten.shortcode).to match(/\A[0-9a-zA-Z_]{6}\z/)
    end

    it 'should contain a redirect counter' do
        shorten = FactoryGirl.create(:shorten)

        expect(shorten.redirect_count).to eql(0)
    end

end
