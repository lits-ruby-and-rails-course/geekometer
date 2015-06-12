class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :condition
      t.integer :difficulty

      t.timestamps null: false
    end
  end
end
