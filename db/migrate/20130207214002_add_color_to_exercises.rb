class AddColorToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :color, :string
  end
end
