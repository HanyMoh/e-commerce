class CreateScanLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :scan_logs do |t|
      t.references :employee_user, index: true, foreign_key: true
      t.string :barcode
      t.string :status

      t.timestamps
    end
  end
end
