class ConvertPhoneNumbersToArray < ActiveRecord::Migration[5.1]
  def change
    remove_column :brands, :main_phone_number, :string
    add_column :brands, :phone_numbers,:string,array: true,default: []
  end
end
