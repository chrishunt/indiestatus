class OrderRequest
  attr_reader :url, :merchant_id, :email, :number

  def initialize(url, merchant_id, email, number)
    @url = url
    @merchant_id = merchant_id
    @email = email
    @number = number
  end

  def body
    Net::HTTP.get(uri)
  end

  private

  def uri
    URI "#{url}?orderNumber=#{number}&email=#{email}&merchantID=#{merchant_id}"
  end
end
