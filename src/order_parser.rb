require "nokogiri"

class OrderParser
  def initialize(html)
    @html = html
  end

  def status
    summary[0].to_i
  end

  def description
    items_in_order.map do |item|
      "#{item[1].split.first} #{item[0]}"
    end.join(", ")
  end

  private

  attr_reader :html

  def summary
    lines[3]
  end

  def items_in_order
    lines[(lines.find_index("Ordered") + 1)..-1].map(&:strip).each_slice(2)
  end

  def lines
    parsed_html.css('td').first.text.split("\r").select do |item|
      !item.strip.empty?
    end
  end

  def parsed_html
    Nokogiri::HTML(html)
  end
end
