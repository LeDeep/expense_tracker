class Money
  attr_reader :price

  def initialize(price)
    @price = price
  end

  # def to_i
  #   (@price * 100).to_i
  # end

  def to_s
    "$%0.2f" % @price
  end

end

