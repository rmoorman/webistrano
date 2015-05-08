class RemoveVersionFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :version, :integer
  end
end
