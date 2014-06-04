class CreatePossibleAnswers < ActiveRecord::Migration
  def change
    create_table :possible_answers do |t|
      t.references :question, index: true
      t.string :title

      t.timestamps
    end
  end
end
