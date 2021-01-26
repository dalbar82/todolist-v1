class Router
  def initialize(mealscontroller)
    @mealscontroller = mealscontroller
    # @customerscontroller = customercontroller
    @running = true
  end

  def run
    puts "Welcome to the Cookbook!"
    puts "           --           "
    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    todo
    case action
    when 1 then mealscontroller.add
    when 2 then mealscontroller.list
    when 3 then customerscontroller.add
    when 4 then customerscontroller.list
    when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Add a new meal"
    puts "2 - List all meals"
    puts "3 - Add a customer"
    puts "4 - List all customers"
    puts "5 - Stop"
  end
end
