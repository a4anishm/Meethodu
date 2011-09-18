class AddFundingAmountToProjectFundingsTable < ActiveRecord::Migration
  def self.up
    add_column :project_fundings, :funding_money, :integer
  end

  def self.down
    drop_column :project_fundings, :funding_money
  end
end
