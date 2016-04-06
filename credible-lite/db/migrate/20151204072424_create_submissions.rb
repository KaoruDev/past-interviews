class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :ssn
      t.integer :income
      t.integer :credit_score
      t.integer :amount

      t.timestamps
    end
  end
end
