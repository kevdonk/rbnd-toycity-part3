class Customer
  attr_reader :name, :price, :stock
  @@customers = []
  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end
  def self.all
    @@customers
  end
  def self.find_by_name(name)
    @@customers.find do |customer|
      name == customer.name
    end
  end
  def add_to_customers
    if !@@customers.any?{|customer| customer.name == @name}
      @@customers << self
    else
      raise DuplicateCustomerError, "'#{@name}' already exists."
    end
  end
  def purchase(product)
    Transaction.new(self,product)
  end
  def return(product)
    Transaction.new(self,product,true)
  end

end
