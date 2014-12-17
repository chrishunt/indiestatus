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
    order_numbers.map { |order_number| order(order_number) }
  end

  private

  def order(order_number)
    order = Order.new(order_number, order_status(order_number))

    {
      number:   order.number,
      progress: order.progress,
      message:  order.message
    }
  end

  def order_status(order_number)
    OrderParser.new(
      OrderRequest.new(
        CONFIG[:indie][:url],
        CONFIG[:indie][:merchant_id],
        email,
        order_number
      ).body
    ).status
  end
end
