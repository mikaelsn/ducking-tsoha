class AddExerciseIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :exercise_id, :integer
  end
end
