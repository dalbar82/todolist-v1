class Meal
  attr_accessor :id, :price
  attr_reader :name

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end
