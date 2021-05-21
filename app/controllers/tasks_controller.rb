# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_journal
  before_action :set_task, only: %i[show edit update destroy]

  def index
    redirect_to @journal
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @description = @task.descriptions.build
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit; end

  # POST /tasks or /tasks.json
  def create
    @task = @journal.tasks.build(task_params)
    @task.position = @journal.get_next_task_position

    if @task.save
      redirect_to @journal,
                  success: 'Task was successfully created.'
    else

      render :new
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      redirect_to @journal,
                  success: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    redirect_to @journal, success: 'Task was successfully destroyed.'
  end

  # def complete
  #   if task.completed? = false
  #     task.update(:completed, true)
  #   end
  #   redirect_to @journal
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_journal
    @journal = current_user.journals.find(params[:journal_id])
  end

  def set_task
    @task = @journal.tasks.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :description, :deadline, :completed)
  end
end
