require 'byebug'

get '/' do
  @urls = Url.all
  @url = Url.new
  # puts "[LOG] Getting /"
  # puts "[LOG] Params: #{params.inspect}"
  erb :"static/index"
end

post '/urls' do
  # puts "[LOG] Params: #{params.inspect}"
  @urls = Url.all
  @url = Url.new(long_url: params[:long_url])
  if @url.save
    redirect '/'
  else
    erb :"static/index"
  end

end

get '/:short_url' do
  url = Url.find_by(short_url: params[:short_url])
  unless url.nil?
    url.click_counter += 1
    url.save
    redirect url.long_url
  end
  redirect '/'
end
