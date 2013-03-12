class CreateCategories < ActiveRecord::Migration
  def change 
    create_table :categories do |t|
      t.column :tags, :string

      t.timestamps
    end
  end
end
