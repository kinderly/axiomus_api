class AxiomusApi::RegionsSerivces < AxiomusApi::Base
  xml_field :cheque, xml_type: :attribute, optional: true
  xml_field :not_open, xml_type: :attribute, optional: true
  xml_field :extrapack, xml_type: :attribute, optional: true
  xml_field :big, xml_type: :attribute, optional: true
end
