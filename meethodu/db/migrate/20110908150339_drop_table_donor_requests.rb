class DropTableDonorRequests < ActiveRecord::Migration
  def self.up
       drop_table :donor_requests
  end

  def self.down
  end
end
