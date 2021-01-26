class Customer
  attr_accessor :address, :id
  attr_reader :name

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end
end
