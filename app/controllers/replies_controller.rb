class RepliesController < ApplicationController
  before_action :set_poll

  def new
    @reply = @poll.replies.build
    @poll.questions.each do |question|
      @reply.answers.build question: question
    end
  end

  def create
    @reply = Reply.new reply_params

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @poll, notice: "Thank you for taking the poll." }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_poll
    @poll = Poll.find params[:poll_id]
  end

  def reply_params
    params.require(:reply).permit({ answers_attributes: [ :value, :question_id ] })
  end
end
