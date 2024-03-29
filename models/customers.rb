require_relative("../db/sqlrunner")
require_relative('tickets')
require_relative('films')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i()
  end

  def save()
    sql = "INSERT INTO customers(name, funds)
    VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films
      sql ="SELECT films.*
    FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id WHERE customer_id = $1";
      values = [@id]
      films = SqlRunner.run(sql, values)
      result = films.map { |film| Film.new(film) }
      return result
  end

  def enough_funds_to_buy_ticket(amount)
    if (@funds - amount > 0)
      return true
    else
      false
    end
  end

  def reduce_funds(amount)
      return  @funds -= amount
  end

  def buy_ticket(film)
    #find price and id of a particular film
    sql="SELECT price, id
    FROM films WHERE title = $1;"
    values = [film]
    result = SqlRunner.run(sql, values)[0]
    price = result['price'].to_i()
    film_id = result['id'].to_i()

    #reduce funds by price
    if (enough_funds_to_buy_ticket(price) != false)
      reduce_funds(price)

      #create new ticket and update db
      ticket = Ticket.new({ 'customer_id' => @id, 'film_id' => film_id })
      ticket.save()

      #save reduced funds to db
      update()
    else
      p "The customer does not have enough funds to buy a ticket"
    end
  end

  def ticket_count
    #use sql COUNT statement
    sql ="SELECT COUNT (*)
  FROM tickets WHERE customer_id = $1;"
  values = [@id]
  result = SqlRunner.run(sql, values)[0]
  ticket_count = result['count'].to_i()
  return ticket_count
  end

end
