class User < ActiveRecord::Base
    
    validates :first_name, :last_name, :user_id, :presence => true
    validates :user_id, :uniqueness => true
    validates :password, :confirmation => true

    validates :password_confirmation, :presence => true
    has_many :friendship

    def User.authenticate(userid,password)
      if user = find_by_user_id(userid)
        if user.password == password
          user
        end
      end
    end

end
