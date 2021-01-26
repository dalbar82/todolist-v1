class View
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}: #{meal.price}"
    end
  end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name}: #{customer.address}"
    end
  end

  def ask_user_for(element)
    puts "What is the #{element.capitalize}?"
    gets.chomp
  end
end
