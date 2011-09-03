class FriendshipSentRequest < ActiveRecord::Base
    validates :from_user, :to_user, :message, :presence => true
    belongs_to :users
end
