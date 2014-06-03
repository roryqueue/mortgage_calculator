class Mortgage
  attr_accessor :home_value, :apr, :duration_in_years

  def initialize(home_value, down_payment_percentage, apr, duration_in_years)
    @home_value = home_value
    @down_payment_percentage = down_payment_percentage
    @apr = apr
    @duration_in_years = duration_in_years
  end

  def monthly_interest_rate
    @apr / 12
  end

  def duration_in_months
    @duration_in_years * 12
  end

  def principal
    @home_value * (1 - @down_payment_percentage)
  end

  def down_payment
    down_payment = @down_payment_percentage * @home_value
  end

  def monthly_payment
    monthly_payment = (principal * monthly_interest_rate *
      ((1 + monthly_interest_rate) ** duration_in_months)) / ((1 + monthly_interest_rate) ** (duration_in_months) - 1)
  end

  def total_interest_paid
    total_interest_paid = (monthly_payment * duration_in_months) - principal
  end

end
