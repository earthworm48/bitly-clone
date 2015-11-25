require_relative '../../config/environments/test'


class Url < ActiveRecord::Base
  before_create :shorten
  def shorten
    self.short_url = 'http://localhost:9393/' + Array.new(6){[*"A".."Z",*'a'..'z', *"0".."9"].sample}.join
  end

  # store the short url to the database
  # validate whether that particular url exist in the table
  def self.exist?

  end
end





