class Project < ActiveRecord::Base
  validates :name, :summary, :description,  :maximum_budget, :days_to_return_money, :user_id, :presence => true
  
end
