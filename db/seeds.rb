require_relative '../config/environments/test'
require 'open-uri'
require 'faker'
require 'byebug'
require 'securerandom'
# require "ar-extensions"

CONN = ActiveRecord::Base.connection
TIMES = 500000

# class UrlImporter
#   def self.import
#     for i in 0..10 do
#       hash = {}
#       long_url = URI(Faker::Internet.url)
#       # short_url = Array.new(6){[*"A".."Z",*'a'..'z', *"0".."9"].sample}.join
#       short_url = SecureRandom.hex(3)
#       hash[:long_url] = long_url
#       hash[:short_url] = short_url
#       url = Url.create!(hash)
#     end
#   end
# end

# UrlImporter.import


# Increase the speed
class UrlImporter
  def self.import
    f = File.open("urls")
    values = f.read.gsub(/[()]/,"").split(",\n")
    # p values[0]
      Url.transaction do
        Url.connection.execute "INSERT INTO urls (long_url,created_at) VALUES (#{values},#{Time.now})"
        # byebug
      end
    # end
  end
end

UrlImporter.import