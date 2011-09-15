class AddReceiverAcceptedToDonorRequests < ActiveRecord::Migration
  def self.up
    add_column :donor_requests, :receiver_accepted, :bool
  end

  def self.down
    remove_column :donor_requests, :receiver_accepted
  end
end
