class RemoveDescriptionFromActivities < ActiveRecord::Migration
  def up
    remove_column :activities, :description
  end

  def down
    add_column :activities, :description, :string
  end
end
