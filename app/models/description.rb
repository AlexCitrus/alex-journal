# frozen_string_literal: true

class Description < ApplicationRecord
  belongs_to :task
  has_rich_text :content
end
