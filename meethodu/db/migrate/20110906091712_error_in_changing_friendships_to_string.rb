class ErrorInChangingFriendshipsToString < ActiveRecord::Migration
  def self.up
    remove_column :friendships, :fiend1_id
    remove_column :friendships, :friend2_id
    add_column :friendships, :friend1_id, :string
    add_column :friendships, :friend2_id, :string
  end

  def self.down
  end

end
