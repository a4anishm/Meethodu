class Friendship < ActiveRecord::Base
    validates :friend1_id, :friend2_id, :begin_date, :how_do_you_know, :presence => true
    belongs_to :user
end
