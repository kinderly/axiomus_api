class AxiomusApi::OrderRequest < AxiomusApi::Request
  xml_field :order

  def prepare_checksum(uid)
    if !auth.nil? && !order.nil?
      auth.checksum = order.checksum(uid)
    end
  end

  def initialize
    @auth = AxiomusApi::Auth.new
  end

end
