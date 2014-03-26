class AxiomusApi::StatusResponse
  class Order
    attr_accessor :id
    attr_accessor :inner_id
    attr_accessor :price
  end

  class Status
    attr_accessor :code
    attr_accessor :description
  end

  class PostStatus
    attr_accessor :tracking
    attr_accessor :postprice
  end

  class Pack
    attr_accessor :number
    attr_accessor :places
    attr_accessor :status
  end

  attr_accessor :d_date
  attr_accessor :refused_items
  attr_accessor :poststatus
  attr_accessor :packs
end
