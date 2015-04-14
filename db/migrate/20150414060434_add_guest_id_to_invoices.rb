class AddGuestIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :guest_id, :integer
  end
end
