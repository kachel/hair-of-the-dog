class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :title
      t.integer :servings
      t.integer :time
      t.text :description

      t.timestamps
    end
  end
end
