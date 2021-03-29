class AddDescriptionToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :description, :text
  end
end
