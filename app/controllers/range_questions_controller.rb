class RangeQuestionsController < ApplicationController

  def index
    redirect_to survey_path(params[:survey_id])
    
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @range_question = RangeQuestion.new
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @range_question = RangeQuestion.new(question_params)
    if @range_question.save!
      flash[:success] = "Your range question has been created!"
      redirect_to edit_survey_path(@survey.id)
    else
      flash.now[:danger] = "Your range question could not be created :("
      render :new
    end
  end

  def show
    @range_question = RangeQuestion.find(params[:id])
    @survey = Survey.find(@range_question.survey_id)
  end

  def edit
    @range_question = RangeQuestion.find(params[:id])
    @survey = Survey.find(@range_question.survey_id)
  end

  def update
    @range_question = RangeQuestion.find(params[:id])
    @survey = Survey.find(@range_question.survey_id)
    if @range_question.update(question_params)
      flash[:success] = "Your question has been updated!"
      redirect_to survey_path(@survey.id)
    else
      flash.now[:danger] = "Your question could not be updated :("
      render :edit
    end
  end
  
  def destroy
    @range_question = RangeQuestion.find(params[:id])
    @survey = Survey.find(@multiple_choice_question.survey_id)
    if @range_question.destroy
      flash[:success] = "Your question has been destroyed!"
      redirect_to edit_survey_path(@survey.id)
    else
      render :show
    end
  end

  private

  def question_params
    params.require(:range_question).permit(:question_text, :range_min, :range_max, :step, :required, :survey_id, :responses => [:id, :answer])
  end

end
