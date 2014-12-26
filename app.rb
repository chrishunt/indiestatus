require "sinatra"
require "json"
require_relative "src/orders_finder"

get "/" do
  content_type "text/plain"

  "Nothing to see here. Visit /you@example.com/1234,5678,9012"
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
