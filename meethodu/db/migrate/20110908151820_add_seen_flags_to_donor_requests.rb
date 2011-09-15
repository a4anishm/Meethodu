class AddSeenFlagsToDonorRequests < ActiveRecord::Migration
  def self.up
    add_column :donor_requests, :seen_by_receiver, :boolean
    add_column :donor_requests, :seen_by_sender, :boolean
  end

  def self.down
    drop_column :donor_requests, :seen_by_receiver
    drop_column :donor_requests, :seen_by_sender
  end
end
