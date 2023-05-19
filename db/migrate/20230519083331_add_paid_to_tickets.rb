class AddPaidToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :paid, :boolean, null: false, default: false
  end
end
