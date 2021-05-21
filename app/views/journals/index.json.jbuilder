# frozen_string_literal: true

json.array! @journals, partial: 'journals/journal', as: :journal
