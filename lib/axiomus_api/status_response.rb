class AxiomusApi::StatusResponse
  class Order
    attr_reader :id
    attr_reader :inner_id
    attr_reader :price
  end

  class Status
    attr_reader :code
    attr_reader :description
  end

  class PostStatus
    attr_reader :tracking
    attr_reader :postprice
  end

  class Pack
    attr_reader :number
    attr_reader :places
    attr_reader :status
  end

  attr_reader :date
  attr_reader :refused_items
  attr_reader :post_status
  attr_reader :packs
end
