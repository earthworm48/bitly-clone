# require 'byebug'
get '/' do
  erb :"static/index"
end

post '/urls' do
  url = Url.create!(long_url: params[:long_url])
  redirect '/'
end

get '/:short_url' do
  url = Url.find_by(short_url: params[:short_url])
  redirect url.long_url
end
