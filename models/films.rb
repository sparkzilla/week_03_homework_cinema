require_relative("../db/sqlrunner")

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i()
  end

end

#   def save()
#     sql = "INSERT INTO customers(name, funds)
#     VALUES ($1, $2) RETURNING id"
#     values = [@name, @funds]
#     customer = SqlRunner.run(sql, values)[0]
#     @id = customer['id'].to_i()
#   end
#
#   def self.delete_all()
#     sql = "DELETE FROM customers"
#     values = []
#     SqlRunner.run(sql, values)
#   end
#
# end
