class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :summary
      t.text :description
      t.integer :minimum_budget
      t.integer :maximum_budget
      t.integer :days_to_return_money
      t.boolean :need_referral

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
