class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def dashboard
    @survey = Survey.find(params[:id])
    @mc_questions = @survey.get_mc_summary
    @range_questions = @survey.get_range_summary
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:success] = "Your survey has been created!"
      redirect_to edit_survey_path(@survey.id)
    else
      flash.now[:danger] = "Your survey could not be created :("
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    Survey.create_mc_responses(params)
    Survey.create_range_responses(params)
    if @survey.update!(survey_params)
      flash[:success] = "Your survey has been updated!"
      redirect_to surveys_path
    else
      flash.now[:danger] = "Your survey could not be updated :("
      render :edit
    end
  end
  
  def destroy
    @survey = Survey.find(params[:id])
    if @survey.destroy
      flash[:success] = "Your survey has been destroyed!"
      redirect_to surveys_path
    else
      render :show
    end
  end

  private

  def survey_params

    params.require(:survey).permit(:title, :description)
  end

end

