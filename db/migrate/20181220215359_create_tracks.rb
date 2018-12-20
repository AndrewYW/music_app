class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.text :lyrics
      t.integer :ord, null: false
      t.boolean :bonus, default: false

      t.timestamps
    end

    add_index :tracks, :ord
  end
end
