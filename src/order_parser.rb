require "nokogiri"

class OrderParser
  def initialize(html)
    @html = html
  end

  def status
    summary[0].to_i
  end

  private

  attr_reader :html

  def summary
    lines[3]
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
