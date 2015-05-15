FactoryGirl.define do

    factory :shorten do
        url 'google.com'
    end

    factory :invalid_url_shorten, parent: :shorten do
        url ''
    end

end