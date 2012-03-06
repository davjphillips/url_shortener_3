class Link < ActiveRecord::Base
  validates :in_url, :out_url, :http_status, :presence => true
  validates :out_url, :uniqueness => true
end
