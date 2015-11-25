require 'byebug'

# get '/' do
#   @urls = Url.all
#   erb :"static/index"
# end

get '/' do
  # @error = "hihi"
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
  # byebug
  if @url.save
    redirect '/'
  else
    # byebug
    # error = "not"

    erb :"static/index"
  end

end

get '/:short_url' do
  url = Url.find_by(short_url: params[:short_url])
  url.click_counter += 1
  url.save
  redirect url.long_url
end
