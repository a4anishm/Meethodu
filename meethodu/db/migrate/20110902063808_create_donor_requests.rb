class CreateDonorRequests < ActiveRecord::Migration
  def self.up
    create_table :donor_requests do |t|
      t.integer :project_id
      t.boolean :sent
      t.date :sent_date
      t.integer :sent_money

      t.timestamps
    end
  end

  def self.down
    drop_table :donor_requests
  end
end
