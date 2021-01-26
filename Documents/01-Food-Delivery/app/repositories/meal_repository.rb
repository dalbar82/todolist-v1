require_relative '../models/meal'
require 'csv'


class MealRepository
  def initialize(csv_file)
    @file_path = csv_file
    @meals = []
    @next_id = 1
    load_csv
  end

  def all
    @meals
  end

  def create(new_meal)
    new_meal.id = @next_id
    @next_id += 1
    @meals << new_meal
    save_to_csv
  end

  def find(meal_id)
    @meals.find { |elem| elem.id == meal_id }
  end

  def save_to_csv
    CSV.open(@file_path, 'wb') do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    if File.exist?(@file_path)
      csv_options = { headers: :first_row, header_converters: :symbol }
      CSV.foreach(@file_path, csv_options) do |row|
        row[:id] = row[:id].to_i
        row[:price] = row[:price].to_i
        meal = Meal.new(row)
        @meals << meal
      end
      @next_id = @meals.last.id + 1
    end
  end
end
