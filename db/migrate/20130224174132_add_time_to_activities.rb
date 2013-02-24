class AddTimeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :time, :date
  end
end
