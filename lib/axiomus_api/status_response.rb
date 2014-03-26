class AxiomusApi::StatusResponse < AxiomusApi::Base
  class Order < AxiomusApi::Base
    xml_field :id, xml_type: :attribute
    xml_field :inner_id, xml_type: :attribute
    xml_field :price, xml_type: :attribute
  end

  class Status < AxiomusApi::Base
    xml_field :code, xml_type: :attribute
    xml_field :description, xml_type: :text
  end

  class PostStatus < AxiomusApi::Base
    xml_field :tracking, xml_type: :attribute
    xml_field :postprice, xml_type: :attribute
  end

  class Pack < AxiomusApi::Base
    xml_field :number, xml_type: :attribute
    xml_field :places, xml_type: :attribute
    xml_field :status, xml_type: :attribute
  end

  xml_field :d_date
  xml_field :refused_items
  xml_field :poststatus
  xml_field :packs
end
