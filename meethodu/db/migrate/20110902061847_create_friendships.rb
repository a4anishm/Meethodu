class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.integer :friend1_id
      t.integer :friend2_id
      t.date :begin_date
      t.string :how_do_you_know

      t.timestamps
    end
  end

  def self.down
    drop_table :friendships
  end
end
