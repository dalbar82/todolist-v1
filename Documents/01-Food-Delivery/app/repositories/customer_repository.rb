require_relative '../models/customer'
require 'csv'

class CustomerRepository
  def initialize(csv_file)
    @file_path = csv_file
    @customers = []
    @next_id = 1
    load_csv
  end

  def all
    @customers
  end

  def create(new_customer)
    new_customer.id = @next_id
    @next_id += 1
    @customers << new_customer
    save_to_csv
  end

  def find(customer_id)
    @customers.find { |elem| elem.id == customer_id }
  end

  def save_to_csv
    CSV.open(@file_path, 'wb') do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    if File.exist?(@file_path)
      csv_options = { headers: :first_row, header_converters: :symbol }
      CSV.foreach(@file_path, csv_options) do |row|
        row[:id] = row[:id].to_i
        customer = Customer.new(row)
        @customers << customer
      end
      @next_id = @customers.last.id + 1
    end
  end
end
