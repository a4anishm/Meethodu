class DonorRequest < ActiveRecord::Base
  validates :project_id, :sent_money, :sent_date, :sent_user_id, :presence => true
end
