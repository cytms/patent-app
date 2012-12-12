class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :patent_id # not sure
      t.integer :user
      t.timestamps
    end
  end
end
