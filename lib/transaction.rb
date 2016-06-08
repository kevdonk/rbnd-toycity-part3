class Transaction
  @@id = 1
  @@transactions = []
  def initialize(customer, product)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    product.decrement_stock
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
