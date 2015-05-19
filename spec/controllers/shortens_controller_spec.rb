require 'rails_helper'

RSpec.describe ShortensController, type: :controller do

    it 'should shorten a url' do
        post :create, { format: 'json', shorten: { url: 'http://example.com' } }

        data = JSON.parse response.body

        expect(response.header['Content-Type']).to include('application/json')
        expect(data['shortcode'].length).to be > 0
    end

    it 'should shorten a url with a preferencial short code' do
        post :create, { format: 'json', shorten: { url: 'http://example.com', shortcode: 'example' } }

        data = JSON.parse response.body

        expect(response.header['Content-Type']).to include('application/json')
        expect(data['shortcode']).to eql('example')
    end

    it 'should return 409 if a shortcode is already taken' do
        post :create, { format: 'json', shorten: { url: 'http://example.com', shortcode: 'example' } }
        post :create, { format: 'json', shorten: { url: 'http://example.com', shortcode: 'example' } }

        expect(response.status).to be(409)
    end

    it 'should return 422 if the preferencial shortcode contains not alphanumeric characters' do
        post :create, { format: 'json', shorten: { url: 'http://example.com', shortcode: '^aa~a' } }

        expect(response.status).to be(422)
    end

    it 'should return 422 if the preferencial shortcode isn’t at least 4 characters long.' do
        post :create, { format: 'json', shorten: { url: 'http://example.com', shortcode: 'aaa' } }

        expect(response.status).to be(422)
    end

end

# Request spec necessary for http requests outside the "/shortens" namespace.
# More information and background here:
# https://relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec
RSpec.describe "Shortcode Redirect", type: :request do

    it 'should redirect to its respective url' do
        post '/shortens' , { format: 'json', shorten: { url: 'http://example.com', shortcode: 'example' } }
        get '/example'

        expect(response).to redirect_to('http://example.com')
    end

    it 'should return 404 if the shortcode was not found' do
        expect(get '/example404').to raise_error
    end

end
