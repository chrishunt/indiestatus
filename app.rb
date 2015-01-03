require "sinatra"
require "json"
require_relative "src/orders_finder"

get "/" do
  send_file File.join(settings.public_folder, 'index.html')
end

get "/:email/:order_numbers" do
  content_type "application/json"

  response["Access-Control-Allow-Origin"] = "*"

  { orders: orders }.to_json
end

private

def orders
  OrdersFinder.find(params[:email], params[:order_numbers].split(","))
end
