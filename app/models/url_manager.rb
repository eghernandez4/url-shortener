# frozen_string_literal: true

class UrlManager < ApplicationRecord
  validates :short_code, uniqueness: true
  scope :exist?, ->(url) { where('url = ? OR url = ? OR url = ?', url, "http://#{url}", "https://#{url}") }
end
