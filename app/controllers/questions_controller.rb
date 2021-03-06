class QuestionsController < ApplicationController
  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to @question
  end

  def destroy
    Question.find(params[:id]).destroy

    redirect_to questions_path
  end

  private

  def question_params
    params
      .require(:question)
      .permit(:question,
              :choice_a, :choice_b, :choice_c, :choice_d, :correct_answer)
  end
end
