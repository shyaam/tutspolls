class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :poll, index: true
      t.string :title
      t.string :kind

      t.timestamps
    end
  end
end
