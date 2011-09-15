class AddSentUserIdCoulmnToDonorRequests < ActiveRecord::Migration
  def self.up
    add_column :donor_requests, :sent_user_id, :string
  end

  def self.down
    drop_column :donor_requests, :sent_user_id
  end
end
