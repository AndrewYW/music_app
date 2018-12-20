class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :studio, default: true
      t.boolean :live, default: false

      t.timestamps
    end
    add_index :albums, :title
    add_index :albums, :year
  end
end
