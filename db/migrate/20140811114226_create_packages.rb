class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :id_p
      t.string :name

      t.timestamps
    end
  end
end
