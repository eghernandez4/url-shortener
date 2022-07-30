# frozen_string_literal: true

require 'rest-client'

# manage request to Alexa API

class Alexa
  def initialize(url)
    @url = url
    @base_url = 'https://awis.api.alexa.com'
  end

  def obtain_rank
    ws_url = "#{@base_url}/api?Action=urlInfo&ResponseGroup=Rank&Output=json&Url=#{@url}"
    response = RestClient.get(ws_url, header)
    JSON.parse(response.body).deep_symbolize_keys
  rescue StandardError => e
    JSON.parse(e.response)
  end

  private

  def header
    { "content_type": 'application/json', "accept": 'application/json', "x-api-key": '8T7SlYd7Tp16a9VPBovC26LXGhosXjeM97CLbUUv'}
  end
end