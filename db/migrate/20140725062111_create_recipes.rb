class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :cookbook_id
      t.string :content

      t.timestamps
    end
  end
end
