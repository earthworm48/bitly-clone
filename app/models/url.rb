require_relative '../../config/environments/test'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  def self.shorten
    @short_url = ''
    @short_url = 'http://goo.gl/' + Array.new(6){[*"A".."Z",*'a'..'z', *"0".."9"].sample}.join
  end

  # store the short url to the database
  # validate whether that particular url exist in the table
  def self.exist?

  end
end

p Url.all



