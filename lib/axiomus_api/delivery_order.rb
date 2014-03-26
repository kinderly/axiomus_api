class AxiomusApi::DeliveryOrder < AxiomusApi::BaseOrder
    attr_accessor :address
    attr_accessor :d_date
    attr_accessor :b_time
    attr_accessor :e_time
    attr_accessor :incl_delivery_sum

    @optional_attributes = [:incl_delivery_sum]
end
