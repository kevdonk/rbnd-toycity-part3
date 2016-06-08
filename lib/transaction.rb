class Transaction
  @@id = 1
  @@transactions = []
  @@total_sales = 0.00
  def initialize(customer, product, is_return=false)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    if is_return
      product.increment_stock
      @@total_sales -= product.price
    else
      product.decrement_stock
      @@total_sales += product.price
    end
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
    @@transactions << self
  end
  def id
    @id
  end
  def customer
    @customer
  end
  def product
    @product
  end
end
