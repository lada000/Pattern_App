class BalanceConverter
  attr_reader :amount_in_byn

  EXCHANGE_RATES = {
    usd: 0.40,
    eur: 0.38,
    rub: 30.00,
    byn: 1.00
  }

  def initialize(amount_in_byn)
    @amount_in_byn = amount_in_byn
  end

  EXCHANGE_RATES.each do |currency, rate|
    define_method "#{currency}" do
      (amount_in_byn * rate).round(2)
    end
  end
end
