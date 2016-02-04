require_relative '../../config/environments/test'
require 'securerandom'
require 'open-uri'
require "net/http"
require "byebug"

class Url < ActiveRecord::Base
  # register Kaminari::Helpers::SinatraHelpers
  # create the url before validate the short_url
  before_create :shorten
  validates :long_url, presence: true, :format => URI::regexp(%w(http https))
  validates :short_url, uniqueness: true
  default_scope {order(id: :desc)}
  # format: { with: /\A(http)s?\:\/\//, message: "invalid email!"}
# 
  # store the short url to the database
  def shorten
    # self.short_url = Array.new(6){[*"A".."Z",*'a'..'z', *"0".."9"].sample}.join
    # until valid?
      self.short_url = SecureRandom.hex(3)
    # end
  end

end





