require "nokogiri"

class OrderParser
  def initialize(html)
    @html = html
  end

  def status
    summary[0].to_i
  end

  def description
    lines[6..-1].map(&:strip).each_slice(2).map do |s|
      "#{s[1].split.first} #{s[0]}"
    end.join(", ")
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
