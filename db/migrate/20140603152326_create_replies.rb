class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :poll, index: true

      t.timestamps
    end
  end
end
