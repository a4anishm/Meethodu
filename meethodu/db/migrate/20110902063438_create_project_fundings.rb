class CreateProjectFundings < ActiveRecord::Migration
  def self.up
    create_table :project_fundings do |t|
      t.integer :project_id
      t.integer :receiver_id
      t.integer :recommender_id
      t.integer :donor_id
      t.date :funding_date

      t.timestamps
    end
  end

  def self.down
    drop_table :project_fundings
  end
end
