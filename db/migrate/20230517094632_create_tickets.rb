class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :code, limit: 16

      t.timestamps
    end
  end
end
