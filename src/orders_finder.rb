require_relative "config"
require_relative "order_request"
require_relative "order_parser"
require_relative "order"

class OrdersFinder
  attr_reader :email, :order_numbers

  def self.find(*args); new(*args).orders; end

  def initialize(email, order_numbers)
    @email = email
    @order_numbers = order_numbers
  end

  def orders
    order_numbers.map { |order_number| find_order(order_number) }
  end

  private

  def find_order(order_number)
    parser = order_parser(order_number)
    order = Order.new(order_number, parser.status, parser.description)

    {
      number: order.number,
      progress: order.progress,
      message: order.message,
      description: order.description
    }
  end

  def order_parser(order_number)
    OrderParser.new(
      OrderRequest.new(
        CONFIG[:indie][:url],
        CONFIG[:indie][:merchant_id],
        email,
        order_number
      ).body
    )
  end
end
