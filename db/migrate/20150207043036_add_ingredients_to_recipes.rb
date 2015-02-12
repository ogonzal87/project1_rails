class AddIngredientsToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :ingredients, :string
  end
end
