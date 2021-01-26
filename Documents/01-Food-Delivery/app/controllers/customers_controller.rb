require_relative '../models/customer'
require_relative '../views/view'

class CustomersController
  def initialize(customerrepository)
    @customerrepository = customerrepository
    @view = View.new
  end

  def list
    customers = @customerrepository.all
    @view.display_customers(customers)
  end

  def add
    name = @view.ask_user_for("name")
    address = @view.ask_user_for("address")
    customer = Customer.new(name: name, address: address)
    @customerrepository.create(customer)
    customers = @customerrepository.all
    @view.display_customers(customers)
  end
end
