class ApplicationController < ActionController::Base
  # include Exceptions::JournalErrors
  # rescue_from ActiveRecord::RecordNotFound, with: :notfound_error
  # rescue_from CreateJournalError, with: :create_journal_error
  # rescue_from UpdateJournalError, with: :update_journal_error
  # rescue_from CreateJournalTaskError, with: :create_journal_task_error
  # rescue_from CreateTaskError, with: :create_task_error
  # rescue_from UpdateTaskError, with: :update_task_error
  # rescue_from UnauthorizedError, with: :unauthorize_error

  def after_sign_in_path_for(resource)
    journals_path # your path
  end

  # def create_journal_error
  #   flash.now[:alert] = 'Failed to create journal'
  #   render 'category/new'
  # end

  # def create_journal_task_error
  #   flash.now[:alert] = 'Failed to create task'
  #   render 'home/new_task'
  # end

  # def update_journal_error
  #   flash.now[:alert] = 'Failed to update journal'
  #   render 'category/edit'
  # end

  # def create_task_error
  #   flash.now[:alert] = 'Failed to create task'
  #   render 'task/new'
  # end

  # def update_task_error
  #   flash.now[:alert] = 'Failed to update task'
  #   render 'task/edit'
  # end
end
