class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.column :purchase_id, :integer
      t.column :category_id, :integer

      t.timestamps
    end
  end
end
