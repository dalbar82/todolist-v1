require_relative '../models/meal'
require_relative '../views/view'

class MealsController
  def initialize(mealsrepository)
    @mealsrepository = mealsrepository
    @view = View.new
  end

  def list
    meals = @mealsrepository.all
    @view.display_meals(meals)
  end

  def add
    name = @view.ask_user_for("name")
    price = @view.ask_user_for("price").to_i
    meal = Meal.new(name: name, price: price)
    @mealsrepository.create(meal)
    meals = @mealsrepository.all
    @view.display_meals(meals)
  end
end
