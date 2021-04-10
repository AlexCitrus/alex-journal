class Task < ApplicationRecord
  belongs_to :journal
  has_many :descriptions, dependent: :destroy
  has_rich_text :description
  validate :not_past_due


  validates :name, presence: true, length: { maximum: 20 }

  validates :description, presence: true, length: { maximum: 2500 }

  validates :deadline, presence: true


  COMPLETED_OPTIONS = [%w[Started false], %w[Completed true]]

  def not_past_due
    return if (deadline.nil? or deadline.today?)

    if self.new_record?
      return errors.add(:deadline, 'is already past') if deadline.past?
    end

    unless self.new_record?
      old_deadline, new_deadline = self.deadline_change

      return if old_deadline.nil?

      return if ((new_deadline == old_deadline) and !new_deadline.past?)

      return errors.add(:deadline, 'is already past') if new_deadline.past?
    end
  end
end
