class Friendship < ActiveRecord::Base
    validates :friend1_id, :friend2_id, :begin_date, :presence => true
    belongs_to :user
end
