require 'byebug'

# get '/' do
#   @urls = Url.all
#   erb :"static/index"
# end

get '/' do
  @urls = Url.all
  # puts "[LOG] Getting /"
  # puts "[LOG] Params: #{params.inspect}"
  erb :"static/index"
end

post '/urls' do
  # puts "[LOG] Params: #{params.inspect}"
  url = Url.find_or_create_by!(long_url: params[:long_url])
  redirect '/'
end

get '/:short_url' do
  url = Url.find_by(short_url: params[:short_url])
  counter = url.click_counter + 1
  url.click_counter = counter
  url.save
  redirect url.long_url
end
