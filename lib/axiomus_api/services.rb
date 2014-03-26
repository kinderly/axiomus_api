class AxiomusApi::Services
  attr_accessor :cash
  attr_accessor :cheque
  attr_accessor :card
  attr_accessor :big

  @optional_attributes = [:cash, :cheque, :card, :big]

  def valid?
    (@cash ^ @cheque ^ @card) || (@cheque && @card)
  end
end
