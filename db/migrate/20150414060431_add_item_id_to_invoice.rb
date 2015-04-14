class AddItemIdToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :item_id, :integer
  end
end
