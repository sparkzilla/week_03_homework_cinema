require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/tickets' )

require( 'pry-byebug' )

# Tickets.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({ 'name' => 'Mark', 'funds' => 50 })
customer1.save()


film1 = Film.new({ 'title' => 'Blade Runner', 'price' => 10})
film1.save()
#
#
# ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id})
# ticket1.save()


binding.pry
nil
