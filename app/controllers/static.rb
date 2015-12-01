require 'byebug'
require_relative '../../config/environments/test'

get '/' do
  
  @urls = Url.all.order(id: :asc)
  @url = Url.new
  # puts "[LOG] Getting /"
  # puts "[LOG] Params: #{params.inspect}"
  erb :"static/index"
end

post '/urls' do
  # puts "[LOG] Params: #{params.inspect}"
  @urls = Url.all
  @url = Url.new(long_url: params[:long_url])
  # if @url.save
  #   redirect '/'
  # else
  #   erb :"static/index"
  # end
  @url.save
  @url.to_json
  "<tr>
      <td class='b5'>#{@url.id}</td>
      <td class='b5'>#{@url.long_url}</td>
      <td class='url'><a href = <#{@url.short_url}>#{@url.short_url}</a></td>
      <td class='b5'>#{@url.click_counter}</td>
   </tr>"
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
