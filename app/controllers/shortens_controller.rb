class ShortensController < ApplicationController

    def index
        @shortens = Shorten.all
    end

    def redirect
        shorten = Shorten.where(shortcode: params[:shortcode])

        unless shorten.length > 0
            render json: { message: 'Page not found.' }, status: 404
            return
        end

        redirect_to shorten.first.url, status: 302
    end

    def create
        unless params[:shorten] and params[:shorten][:url]
            render json: {
                message: 'The request was invalid. URL was not present.'
            }, status: 400
            return
        end

        if params[:shorten][:shortcode] and params[:shorten][:shortcode].length > 0
            shortcode = params[:shorten][:shortcode]

            shortens = Shorten.where("shortcode = ?", shortcode)

            if shortens.length > 0
                render json: { message: 'Shortcode already taken.' }, status: 409
                return
            end

            unless shortcode.match(/\A[0-9a-zA-Z_]{4,}\z/)
                render json: {
                    message: 'The shortcode should contain only alphanumeric characters and '\
                            'be at least 4 characters long.'
                }, status: 422
                return
            end
        end

        shorten = Shorten.new shorten_params

        if shorten.save
            render json: { shortcode: shorten.shortcode }, status: 200
        else
            render json: { message: 'Something went wrong. Couldn\'t short your URL' }, status: 500
        end
    end

    private
        def shorten_params
            params.require(:shorten).permit(:url, :shortcode)
        end
end

