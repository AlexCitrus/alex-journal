# frozen_string_literal: true

json.extract! journal, :id, :name, :user_id, :created_at, :updated_at
json.url journal_url(journal, format: :json)
