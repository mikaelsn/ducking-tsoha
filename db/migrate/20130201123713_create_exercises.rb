class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.date :time
      t.string :feel

      t.timestamps
    end
  end
end
