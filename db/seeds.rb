require_relative '../config/environments/test'
require 'open-uri'
require 'faker'
require 'byebug'
require 'securerandom'

class UrlImporter
  def self.import
    for i in 0..10 do
      hash = {}
      long_url = URI(Faker::Internet.url)
      # short_url = Array.new(6){[*"A".."Z",*'a'..'z', *"0".."9"].sample}.join
      short_url = SecureRandom.hex(3)
      hash[:long_url] = long_url
      hash[:short_url] = short_url
      url = Url.create!(hash)
    end
  end
end

UrlImporter.import