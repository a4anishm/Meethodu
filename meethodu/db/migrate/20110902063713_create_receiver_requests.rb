class CreateReceiverRequests < ActiveRecord::Migration
  def self.up
    create_table :receiver_requests do |t|
      t.integer :project_id
      t.boolean :received
      t.date :received_date
      t.integer :received_money
      t.timestamps
    end
  end

  def self.down
    drop_table :receiver_requests
  end
end
