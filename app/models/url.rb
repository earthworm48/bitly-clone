require_relative '../../config/environments/test'
require 'securerandom'

class Url < ActiveRecord::Base
  before_create :shorten
  def shorten
    # self.short_url = Array.new(6){[*"A".."Z",*'a'..'z', *"0".."9"].sample}.join
    self.short_url = SecureRandom.hex(6)
  end

  # store the short url to the database
  # validate whether that particular url exist in the table
  def self.exist?

  end
end





