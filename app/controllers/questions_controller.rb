class QuestionsController < ApplicationController
  before_action :authorize_request
  before_action :set_question, only: %i[ show update destroy ]

  # GET /questions
  def index
    resHash = {}
    type = params[:question_type]
    if type
      @questions = Question.where(question_type: type)
    else
      @questions = Question.all
    end
    resHash["questions"] = @questions
    render json: resHash
  end

  # GET /questions/1
  def show
    render json: @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:prompt, :right_answer, :question_type, :xp, :game_over_message, :answers => [])
    end
end
