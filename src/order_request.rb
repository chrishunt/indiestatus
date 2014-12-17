class OrderRequest
  attr_reader :url, :merchant_id, :email, :number

  def initialize(url, merchant_id, email, number)
    @url = url
    @merchant_id = merchant_id
    @email = email
    @number = number
  end

  def body
    response.body
  end

  private

  def response
    Net::HTTP.post_form URI(url),
      'orderNumber' => number,
      'Email'       => email,
      'MerchantID'  => merchant_id
  end
end
