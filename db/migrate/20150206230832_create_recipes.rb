class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :time
      t.text :directions
      t.string :image_file

      t.timestamps null: false
    end
  end
end
