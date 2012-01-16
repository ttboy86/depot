class AddShippedDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipped_date, :datetime
  end
end
