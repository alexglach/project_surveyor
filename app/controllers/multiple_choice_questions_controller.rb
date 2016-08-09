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
      flash[:success] = "Your multiple choice question has been created!"
      redirect_to edit_multiple_choice_question_path(@multiple_choice_question.id)
    else
      flash.now[:danger] = "Your multiple choice question could not be created :("
      render :new
    end
  end

  def show
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
    @survey = Survey.find(@multiple_choice_question.survey_id)
  end

  def edit
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
    @survey = Survey.find(@multiple_choice_question.survey_id)
    @multiple_choice_question.options.build
  end

  def update
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
    @survey = Survey.find(@multiple_choice_question.survey_id)
    if @multiple_choice_question.update(question_params)
      flash[:success] = "Your question has been updated!"
      redirect_to edit_multiple_choice_question_path(@multiple_choice_question.id)
    else
      flash.now[:danger] = "Your question could not be updated :("
      render :edit
    end
  end
  
  def destroy
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
    @survey = Survey.find(@multiple_choice_question.survey_id)
    if @multiple_choice_question.destroy
      flash[:success] = "Your question has been destroyed!"
      redirect_to edit_survey_path(@survey.id)
    else
      render :show
    end
  end

  private

  def question_params
    params.require(:multiple_choice_question).permit(:question_text, :required, :one_answer, :survey_id, :responses => [:id, :answer], :options_attributes => [:id, :answer, :multiple_choice_question_id, :_destroy])
  end
end
