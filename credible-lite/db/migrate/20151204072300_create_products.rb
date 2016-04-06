class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :lender_id
      t.integer :term
      t.decimal :apr, precision: 5, scale: 2
      t.integer :min_credit_score
      t.integer :min_income

      t.timestamps
    end

    add_index :products, :lender_id
  end
end
