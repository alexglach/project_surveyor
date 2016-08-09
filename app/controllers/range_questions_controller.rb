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
      redirect_to survey_path(@survey.id)
    else
      flash.now[:danger] = "Your range question could not be created :("
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:survey_id])
    @range_question = RangeQuestion.find(params[:id])
  end

  def edit
    @survey = Survey.find(params[:survey_id])
    @range_question = RangeQuestion.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:survey_id])
    @range_question = RangeQuestion.find(params[:id])
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
    if @range_question.destroy
      flash[:success] = "Your question has been destroyed!"
      redirect_to surveys_path
    else
      render :show
    end
  end

  private

  def question_params
    params.require(:range_question).permit(:question_text, :range_min, :range_max, :step, :required, :survey_id)
  end

end
