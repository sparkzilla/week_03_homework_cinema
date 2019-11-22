require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/tickets' )

require( 'pry-byebug' )

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({ 'name' => 'Mark', 'funds' => 50 })
customer1.save()
customer2 = Customer.new({ 'name' => 'Mary', 'funds' => 20 })
customer2.save()
customer3 = Customer.new({ 'name' => 'Aran', 'funds' => 5 })
customer3.save()


film1 = Film.new({ 'title' => 'Blade Runner', 'price' => 10})
film1.save()
film2 = Film.new({ 'title' => 'Star Wars', 'price' => 5})
film2.save()
film3 = Film.new({ 'title' => 'Raiders Of The Lost Ark', 'price' => 15})
film3.save()
film4 = Film.new({ 'title' => 'Lord Of The Rings', 'price' => 10})
film4.save()


ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film3.id})
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film4.id})
ticket4.save()
ticket5 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film1.id})
ticket5.save()
ticket6 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film3.id})
ticket6.save()
ticket7 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film3.id})
ticket7.save()
ticket8 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film4.id})
ticket8.save()


binding.pry
nil
