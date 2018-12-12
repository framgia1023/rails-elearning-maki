class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :choice
      t.boolean :correct
      t.references :word
      t.timestamps
    end
  end
end

