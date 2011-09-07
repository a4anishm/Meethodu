class AlterFriendshipRequestFieldsToString < ActiveRecord::Migration
  def self.up
    remove_column :friendship_sent_requests, :from_user
    remove_column :friendship_sent_requests, :to_user
    add_column :friendship_sent_requests, :from_user, :string
    add_column :friendship_sent_requests, :to_user, :string

  end

  def self.down
  end
end
