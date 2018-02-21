class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question
      t.string :choice_a
      t.string :choice_b
      t.string :choice_c
      t.string :choice_d

      t.timestamps
    end
  end
end
