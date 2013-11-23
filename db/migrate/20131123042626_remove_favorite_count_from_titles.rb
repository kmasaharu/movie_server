class RemoveFavoriteCountFromTitles < ActiveRecord::Migration
  def change
    remove_column :titles, :favorite_count, :integer
  end
end
