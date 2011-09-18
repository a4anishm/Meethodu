class AddSponsorReceivedMoneyToDonorRequests < ActiveRecord::Migration
  def self.up
    add_column :donor_requests, :sponsor_received_money, :boolean
  end

  def self.down
    drop_column :donor_requests, :sponsor_received_money
  end
end
