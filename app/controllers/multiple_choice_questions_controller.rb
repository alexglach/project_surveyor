class MultipleChoiceQuestionsController < ApplicationController

  def index
    redirect_to survey_path(params[:survey_id])
    
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @multiple_choice_question = MultipleChoiceQuestion.new
  
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @multiple_choice_question = MultipleChoiceQuestion.new(question_params)
    if @multiple_choice_question.save!
      flash[:success] = "Your range question has been created!"
      redirect_to survey_path(@survey.id)
    else
      flash.now[:danger] = "Your range question could not be created :("
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:survey_id])
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
  end

  def edit
    @survey = Survey.find(params[:survey_id])
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
    @mulitple_choice_question.options.build
  end

  def update
    @survey = Survey.find(params[:survey_id])
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
    if @multiple_choice_question.update(question_params)
      flash[:success] = "Your question has been updated!"
      redirect_to survey_path(@survey.id)
    else
      flash.now[:danger] = "Your question could not be updated :("
      render :edit
    end
  end
  
  def destroy
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
    if @multiple_choice_question.destroy
      flash[:success] = "Your question has been destroyed!"
      redirect_to surveys_path
    else
      render :show
    end
  end

  private

  def question_params
    params.require(:multiple_choice_question).permit(:question_text, :required, :one_answer, :survey_id, :options_attributes => [:text])
  end
end
