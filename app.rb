require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  # build the API url, including the API key in the query string
  api_url = "https://api.exchangerate.host/list?access_key=#{ENV["EXCHANGE_RATE_KEY"]}"

  # use HTTP.get to retrieve the API information
  raw_data = HTTP.get(api_url)

  # convert the raw request to a string
  raw_data_string = raw_data.to_s

  # convert the string to JSON
  @parsed_data = JSON.parse(raw_data_string)

  # Here, get the currency symbols from the JSON, I recommend starting by 
  # making it an instance variable (@parsed_data), then showing that 
  # instance variable in the `views/homepage.erb` view template that you 
  # are rendering below (use <%= %> ERB tags to render it in that view template).

  # render a view template where I show the symbols
  erb(:homepage)
end
