# frozen_string_literal: true

class JournalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_journal, only: %i[show edit update destroy]
  before_action :set_locale

  def set_locale
    if current_user.language == "English"
      I18n.locale = :en
    elsif current_user.language == "Filipino"
      I18n.locale = :tl
    end
  end

  # GET /journals or /journals.json
  def index
    @journals = current_user.journals
  end

  # GET /journals/1 or /journals/1.json
  def show; end

  # GET /journals/new
  def new
    @journal = Journal.new
  end

  # GET /journals/1/edit
  def edit; end

  # POST /journals or /journals.json
  def create
    @journal = current_user.journals.build(journal_params)

    respond_to do |format|
      if @journal.save
        format.html do
          redirect_to journals_path,
                      success: I18n.t(:category_success)
        end
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @journal.errors, status: :unprocessable_entity
        end
      end
    end

    # if @journal.save
    #   redirect_to journals_path,
    #               notice: 'Task was successfully created.'
    # else
    #   render :new
    # end
  end

  # PATCH/PUT /journals/1 or /journals/1.json
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.html do
          redirect_to journals_path, success: I18n.t(:category_success_update)
        end
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @journal.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /journals/1 or /journals/1.json
  def destroy
    @journal.destroy
    respond_to do |format|
      format.html do
        redirect_to journals_url, success: "Category was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_journal
    @journal = current_user.journals.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def journal_params
    params.require(:journal).permit(:name)
  end
end
