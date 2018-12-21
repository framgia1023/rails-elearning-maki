class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user
      t.integer :action_id
      t.string :action_type
      t.timestamps
    end
    add_index :activities, [:user_id, :action_id, :action_type]
  end
end
