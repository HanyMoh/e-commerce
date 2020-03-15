class CreateCurrencyExRates < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_ex_rates do |t|
      t.references :brand
      t.references :organization
      t.timestamps
    end
  end
end
