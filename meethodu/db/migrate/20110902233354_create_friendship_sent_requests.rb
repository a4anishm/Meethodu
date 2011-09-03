class CreateFriendshipSentRequests < ActiveRecord::Migration
  def self.up
    create_table :friendship_sent_requests do |t|
      t.integer :from_user
      t.integer :to_user
      t.string :message
      t.date :sent_date

      t.timestamps
    end
  end

  def self.down
    drop_table :friendship_sent_requests
  end
end
