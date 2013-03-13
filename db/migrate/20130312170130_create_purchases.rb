class CreatePurchases < ActiveRecord::Migration
  def change 
    create_table :purchases do |t|
      t.column :item, :string
      t.column :cost, :decimal, :precision => 15, :scale => 2
      t.column :date, :date

      t.timestamps
    end
  end
end
