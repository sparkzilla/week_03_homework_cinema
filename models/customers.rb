require_relative("../db/sqlrunner")

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

  def buy_ticket(film)
    #find price for a particular film
    sql="SELECT price
    FROM films WHERE title = $1;"
    values = [film]
    price = SqlRunner.run(sql, values)[0]
    price = price['price'].to_i()
    p price
    #buy_ticket (add ticket to tickets db)
    #reduce funds by price
  end
end
