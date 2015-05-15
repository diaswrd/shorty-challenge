FactoryGirl.define do

    factory :shorten do
        url 'google.com'
        shortcode 'googl'

        factory :invalid_url_shorten do
            url ''
            shortcode 'empty'
        end

        factory :no_shortcode_shorten do
            url 'google.com'
            shortcode nil
        end
    end

end