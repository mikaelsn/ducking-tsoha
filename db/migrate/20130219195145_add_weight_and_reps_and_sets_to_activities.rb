class AddWeightAndRepsAndSetsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :weight, :integer
    add_column :activities, :reps, :integer
    add_column :activities, :sets, :integer
  end
end
