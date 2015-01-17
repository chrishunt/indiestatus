class Order
  attr_reader :number, :status, :description

  STATUS_MESSAGE = [
    'In processing queue',
    'In scanning queue',
    'In correction queue',
    'In upload queue',
    'In shipping queue',
    'Shipped',
    'Received'
  ]

  def initialize(number, status, description)
    @number = number
    @status = status
    @description = description
  end

  def progress
    "(#{status}/#{STATUS_MESSAGE.count})"
  end

  def message
    STATUS_MESSAGE.fetch(status - 1)
  end
end
