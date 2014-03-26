class AxiomusApi::AxiomusRegion < AxiomusApi::Base
  class City < AxiomusApi::Base
    xml_field :code, xml_type: :attribute, xml_name: :city_code
    xml_field :name, xml_type: :text
  end

  class Office < AxiomusApi::Base
    xml_field :code, xml_type: :attribute, xml_name: :office_code
    xml_field :city_code, xml_type: :attribute
    xml_field :name, xml_type: :text
  end

  xml_field :code, xml_type: :attribute, xml_name: :region_code
  xml_field :name, xml_type: :attribute
  xml_field :courier
  xml_field :pickup
end
