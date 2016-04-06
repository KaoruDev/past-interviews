class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
