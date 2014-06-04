class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_poll
  before_action :set_kind_options, only: [ :new, :create, :edit, :update ]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = @poll.questions.build
    7.times { @question.possible_answers.build }
  end

  def edit
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @poll, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to @poll, notice: 'Question dropped.' }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:poll_id, :title, :kind, { possible_answers_attributes: [ :question_id, :title ] } )
    end

    def set_kind_options
      @kind_options = [ [ "Open answer", "open" ], [ "Choice", "choice"] ]
    end

    def set_poll
      @poll = Poll.find params[:poll_id]
    end
end
