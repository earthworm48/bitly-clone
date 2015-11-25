get '/' do
  erb :"static/index"
end

post '/urls' do
  long_url = params[:long_url]
  url = Url.create!(long_url: long_url)
  url.shorten

  redirect '/'
end

get '/:short_url' do
  Redirect Url.find_by(short_url: params[:short_url]).long_url

end
