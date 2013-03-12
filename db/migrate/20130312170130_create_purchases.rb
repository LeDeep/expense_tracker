class CreatePurchases < ActiveRecord::Migration
  def change 
    create_table :purchases do |t|
      t.column :item, :string
      t.column :cost, :integer
      t.column :date, :string
      t.column :category_id, :integer

      t.timestamps
    end
  end
end