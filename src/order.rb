class Order
  attr_reader :number, :status

  STATUS_MESSAGE = [
    'In processing queue',
    'In scanning queue',
    'In correction queue',
    'In upload queue',
    'In shipping queue',
    'Shipped'
  ]

  def initialize(number, status)
    @number = number
    @status = status
  end

  def progress
    "(#{status}/#{STATUS_MESSAGE.count})"
  end

  def message
    STATUS_MESSAGE.fetch(status - 1)
  end
end
