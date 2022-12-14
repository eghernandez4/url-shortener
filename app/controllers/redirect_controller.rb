# frozen_string_literal: true

# url_manager
class RedirectController < ApplicationController
  def redirect
    url = UrlManager.find_by_short_code(params[:short_code])
    if url.blank?
      render status: 400, json: { message: 'url no encontrada' }
    else
      url.update(counter: url.counter += 1)
      link = url.url.first(4) == 'http' ? url.url : "http://#{url.url}"
      redirect_to link, allow_other_host: true
    end
  end
end
