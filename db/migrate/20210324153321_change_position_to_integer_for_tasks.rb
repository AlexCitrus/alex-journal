# frozen_string_literal: true

class ChangePositionToIntegerForTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :position, :integer, using: 'position::integer'
  end
end
