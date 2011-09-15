class AddProjectIdToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :project_id, :integer
  end

  def self.down
    drop_column :projects, :project_id
  end
end
