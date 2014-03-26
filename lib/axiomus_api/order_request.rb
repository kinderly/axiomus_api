class AxiomusApi::OrderRequest < AxiomusApi::Request
  xml_field :order

  def prepare_checksum(uid)
    if !auth.nil?
      auth.checksum = order.checksum(uid)
    end
  end

end
