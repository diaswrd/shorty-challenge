class Shorten < ActiveRecord::Base

    before_validation :check_url_protocol

    after_initialize :set_defaults, unless: :persisted?

    validates :url, presence: true, url: true

    validates :shortcode,
        uniqueness: true,
        allow_blank: true,
        format: {
            with: /\A[0-9a-zA-Z_]{4,}\z/,
            message: 'The shortcode should contain only alphanumeric characters (a - z, A - Z, 0 - 9).'
        },
        length: {
            minimum: 4,
            message: 'The shortcode should be at least 4 characters long.'
        }

    def check_url_protocol
        unless self.url[/\Ahttp:\/\//] or self.url[/\Ahttps:\/\//]
            self.url = "http://#{self.url}"
        end
    end

    def set_defaults
        self.last_seen_date ||= Time.now
        self.redirect_count ||= 0
        self.shortcode ||= generate_shortcode
    end

end

def generate_shortcode
    generated_shortcode = ''
    alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

    for i in 0..5
        generated_shortcode += alphabet[rand(alphabet.length - 1)]
    end

    return generated_shortcode
end
