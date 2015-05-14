class Shorten < ActiveRecord::Base

    after_initialize :set_defaults, unless: :persisted?

    validates :url, presence: true, url: { no_local: true }

    validates :shortcode,
        uniqueness: true,
        allow_blank: true,
        format: {
            with: /\A[0-9a-zA-Z_]{4,}\z/,
            message: "The shortcode should contain only alphanumeric characters (a - z, A - Z, 0 - 9)."
        },
        length: {
            minimum: 4,
            message: "The shortcode should be at least 4 characters long."
        }

    def set_defaults
        self.last_seen_date ||= Time.now
        self.redirect_count ||= 0
    end

end
