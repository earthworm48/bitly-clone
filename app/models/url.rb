require_relative '../../config/environments/test'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  def self.shorten
    Array.new(6){[*"A".."Z", *"0".."9"].sample}.join
  end
end

p Url.shorten



