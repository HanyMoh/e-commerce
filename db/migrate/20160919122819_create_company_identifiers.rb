class CreateCompanyIdentifiers < ActiveRecord::Migration[5.1]
  def change
    create_table :company_identifiers do |t|
      t.string :name
      t.string :description
      t.string :identifier
      t.integer :type

      t.timestamps null: false
    end
  end
end
