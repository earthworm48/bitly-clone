require_relative '../config/environments/test'
require 'open-uri'
require 'faker'
require 'byebug'
require 'securerandom'
# require "ar-extensions"

CONN = ActiveRecord::Base.connection

# Increase the speed
# CANNOT INSERT SHORT_URL (VALUE = NIL) INTO THE TABLE!
class UrlImporter
  def self.import
    f = File.open("urls")
    values = f.read.gsub(/\(/,"").gsub(/\)/,"").split(",\n")
    sql = "INSERT INTO urls (long_url,short_url,created_at,updated_at) VALUES "
    values[0..100].each do |x|
      short_url = SecureRandom.hex(3)
      sql << "('#{x}', '#{short_url}', '#{Time.now}', '#{Time.now}'),"
    end
    sql = sql.chomp(',') + ";"
    CONN.execute sql
    # ActiveRecord::Base.connection.reset_pk_sequence!('urls')
  end
end

UrlImporter.import
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





