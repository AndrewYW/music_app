class RemoveStudioFromAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :studio
  end
end
