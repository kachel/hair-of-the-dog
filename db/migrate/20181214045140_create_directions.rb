class CreateDirections < ActiveRecord::Migration[5.2]
  def change
    create_table :directions do |t|
      t.integer :recipe_id
      t.text :step_1
      t.text :step_2
      t.text :step_3
      t.text :step_4
      t.text :step_5

      t.timestamps
    end
  end
end
