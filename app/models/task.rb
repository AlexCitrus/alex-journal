class Task < ApplicationRecord
  belongs_to :journal
  has_many :descriptions
  has_rich_text :description
end
