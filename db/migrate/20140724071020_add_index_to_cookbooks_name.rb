class AddIndexToCookbooksName < ActiveRecord::Migration
  def change
  	add_index :cookbooks, :name, unique: true
  end
end
