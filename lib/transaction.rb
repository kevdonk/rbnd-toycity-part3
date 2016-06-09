class Transaction
  attr_reader :id, :customer, :product
  @@id = 1
  @@transactions = []
  @@total_sales = 0.00
  def initialize(customer, product, is_return=false)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    @is_return = is_return
    add_to_transactions
  end
  def self.all
    @@transactions
  end
  def self.find(id)
    @@transactions.find do |transaction|
      id == transaction.id
    end
  end
  def self.total_sales
    @@total_sales
  end
  def add_to_transactions
    if @product.in_stock?
      if @is_return
        product.increment_stock
        @@total_sales -= product.price
      else
        product.decrement_stock
        @@total_sales += product.price
      end
      @@transactions << self
    else
      raise OutOfStockError, "'#{product.title}' is out of stock."
    end
  end
end
