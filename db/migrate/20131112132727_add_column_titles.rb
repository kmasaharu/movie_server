class AddColumnTitles < ActiveRecord::Migration
  def change
    add_column :titles, :image_url, :string, limit: 1024
  end
end
