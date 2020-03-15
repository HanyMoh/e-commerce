class AddAttributesToCurrencyExRates < ActiveRecord::Migration[5.1]
  def change
    add_column :currency_ex_rates, :base_currency, :string
    add_column :currency_ex_rates, :currency, :string
    add_column :currency_ex_rates, :e_rate, :float
  end
end
