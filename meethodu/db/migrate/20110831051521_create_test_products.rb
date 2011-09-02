class CreateTestProducts < ActiveRecord::Migration
  def self.up
    create_table :test_products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :test_products
  end
end
