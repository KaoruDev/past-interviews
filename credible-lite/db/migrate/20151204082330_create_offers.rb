class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :submission_id
      t.integer :product_id
      t.decimal :apr, precision: 5, scale: 2
      t.integer :term
      t.decimal :total_cost, precision: 9, scale: 2
      t.decimal :total_interest, precision: 9, scale: 2
      t.decimal :monthly_payment, precision: 9, scale: 2

      t.timestamps
    end

    add_index :offers, [:submission_id, :product_id]
  end
end
