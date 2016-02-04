require 'byebug'
require_relative '../../config/environments/test'

get '/' do
  
  @urls = Url.all.order(id: :desc)
  @url = Url.new
  # puts "[LOG] Getting /"
  # puts "[LOG] Params: #{params.inspect}"
  erb :"static/index"
end

post '/urls' do
  @urls = Url.all
  @url = Url.new(long_url: params[:long_url])
  # if @url.save
  #   redirect '/'
  # else
  #   erb :"static/index"
  # end
  if @url.save
    @url.to_json
    "<div class='url-row'>
      <p>#{@url.long_url}</p>
      
      <p>
        <a href = #{@url.short_url}>#{@url.short_url}</a>

        <span class='click-counter'>#{@url.click_counter}</span>
      </p>
    </div>"
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
