class QuestionsController < ApplicationController
  protect_from_forgery :except => [:create] #コレなんで。
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    # @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: "Success"
    else
      flash[:alert] = "Save Error!"
    end
  end

  def edit
    # @question = Question.find(params[:id])
  end

  def update
    # @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path, notice: "Success"
    else
      flash[:alert] = "Save Error!"
      render :edit
    end
  end

  def destroy
    # @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: 'success'

  end

  private
    def set_question
      @question = Question.find(params[:id])
    end
    def question_params
      params.require(:question).permit(:name,:title,:content)
    end
end

