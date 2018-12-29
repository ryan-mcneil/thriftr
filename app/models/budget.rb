class Budget
  attr_reader :name

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def balance
    @balance/1000.00
  end


end
