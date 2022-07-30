# frozen_string_literal: true

# url_manager
class RedirectController < ApplicationController
  def redirect
    url = UrlManager.find_by_short_code(params[:short_code])
    if url.blank?
      render status: 400, json: { message: 'url no encontrada' } 
    else
      url.update(counter: url.counter += 1)
      render status: 302, json: { url: url.url }
    end
  end
end
