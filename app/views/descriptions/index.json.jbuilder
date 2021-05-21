# frozen_string_literal: true

json.array! @descriptions, partial: 'descriptions/description', as: :description
