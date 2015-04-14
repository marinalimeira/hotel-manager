class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :item_quantity
      t.float :amount

      t.timestamps
    end
  end
end
