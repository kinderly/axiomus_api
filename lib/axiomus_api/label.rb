require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/png_outputter'
require 'base64'
require 'erb'

class AxiomusApi::Label
  attr_accessor :dispatch_number
  attr_accessor :order_id
  attr_accessor :client_name
  attr_accessor :weight
  attr_accessor :date
  attr_accessor :b_time
  attr_accessor :e_time
  attr_accessor :place
  attr_accessor :places
  attr_accessor :address
  attr_accessor :type
  attr_accessor :city

  def dispatch_number_formatted
    dispatch_number.to_s.gsub(/(....)$/, '`\1')
  end

  def barcode_raw(height = 70)
    barcode = Barby::Code39.new("#{dispatch_number}+#{place}")
    barcode.wide_width = 3
    Base64.encode64(barcode.to_png(height: height, margin: 0))
  end

  def barcode_base64(height = 70)
    s = barcode_raw(height)
    "data:image/png;base64,#{s}"
  end

  def self.render(labels, template = nil)
    renderer = ERB.new(template || default_template)
    labels = labels.is_a?(Array) ? labels : [labels]
    @labels = labels.select{|l| l.is_a?(AxiomusApi::Label)}
    renderer.result(binding)
  end

  private

  def self.default_template
    File.read(default_erb)
  end

  def self.default_erb
    File.join(File.dirname(File.expand_path(__FILE__)), 'templates/labels.html.erb')
  end

end
