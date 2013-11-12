class AddColumnTitles < ActiveRecord::Migration
  def change
    add_column :titles, :image_url, :string
  end
end
