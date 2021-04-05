# frozen_string_literal: true

class CompleterReflex < ApplicationReflex

  def complete
    task = Task.find(element.dataset[:task_id])
    task.update(completed: !task.completed)
    # redirect_to @Journal
    # redirect_back(fallback_location: fallback_location)
    # @halted = true
  end

end
