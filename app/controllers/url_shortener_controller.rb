# frozen_string_literal: true

# url_manager
class UrlShortenerController < ApplicationController
  def url_shortener
    url = UrlManager.find_or_initialize_by(permited_params)
    url.short_code = short_code
    url.alexa_rank = obtain_rank(url.url)
    if url.save
      render status: 200, json: { url_short: "#{request.base_url}/#{url.short_code}" }
    else
      render status: 400, json: { message: "Ha ocurrido un error inesperado: #{url.errors.full_message}" }
    end
  end

  def obtain_info
    url = UrlManager.exist?(params[:url])
    if url.present?
      render json: { data: url.first }
    else
      render status: 400, json: { message: 'No se encontraron resultados' }
    end
  end

  private

  def permited_params
    params.require(:url_shortener).permit(:url)
  end

  def short_code
    Random.urlsafe_base64(4)
  end

  def obtain_rank(url)
    alexa = Alexa.new(url)
    rank = alexa.obtain_rank
    rank[:Awis][:Results][:Result][:Alexa][:TrafficData][:Rank]
  end
end
