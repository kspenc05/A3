class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.integer :c1
      t.integer :c2
      t.integer :c3
      t.integer :c4

      t.timestamps
    end
  end
end
