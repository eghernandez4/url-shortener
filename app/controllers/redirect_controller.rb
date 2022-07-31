# frozen_string_literal: true

# url_manager
class RedirectController < ApplicationController
  def redirect
    url = UrlManager.find_by_short_code(params[:short_code])
    if url.blank?
      render status: 400, json: { message: 'url no encontrada' } 
    else
      url.update(counter: url.counter += 1)
      link = "http://#{url.url}" unless url.url.first(4) == 'http'
      redirect_to url.url, allow_other_host: true
    end
  end
end
