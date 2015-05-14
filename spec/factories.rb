FactoryGirl.define do

    factory :shorten do
        url 'http://google.com'
    end

    factory :invalid_url_shorten, parent: :shorten do
        url 'foo'
    end

end