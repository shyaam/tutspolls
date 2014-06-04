class AddPossibleAnswerIdToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :possible_answer, index: true
  end
end
