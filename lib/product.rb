class Product
  attr_reader :title
  @@products = []
  def initialize(options={})
    @title = options[:title]
    add_to_products
  end
  def self.all
    @@products
  end
  def add_to_products
    if !@@products.any?{|product| product.title == @title}
      @@products << self
    else
      raise DuplicateProductError, "'#{@title}' already exists."
    end
  end
end
