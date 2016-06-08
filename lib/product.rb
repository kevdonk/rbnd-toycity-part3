class Product
  attr_reader :title, :price, :stock
  @@products = []
  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end
  def self.all
    @@products
  end
  def self.find_by_title(title)
    @@products.find do |product|
      title == product.title
    end
  end
  def self.in_stock
    @@products.select do |product|
      product.in_stock?
    end
  end
  def add_to_products
    if !@@products.any?{|product| product.title == @title}
      @@products << self
    else
      raise DuplicateProductError, "'#{@title}' already exists."
    end
  end
  def in_stock?
    @stock > 0
  end
  def decrement_stock
    @stock -= 1
  end
  def increment_stock
    @stock += 1
  end
end
