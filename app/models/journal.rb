class Journal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def get_next_task_position
    if tasks.none? { |page| page.persisted?}
      1
    else
      tasks.order(position: :asc).last.position + 1
    end
  end
end
