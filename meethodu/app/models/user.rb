class User < ActiveRecord::Base
    
    validates :first_name, :last_name, :gender, :address_line1, :address_line2, :city, :state, :zipcode, :user_id, :about_me, :interests, :presence => true
    validates :user_id, :uniqueness => true
    validates :password, :confirmation => true

    validates :password_confirmation, :presence => true
    has_many :friendship

private
    def password_must_be_present
        errors.add(:_password, "Missing password") unless hashed_password.present?
    end
end
