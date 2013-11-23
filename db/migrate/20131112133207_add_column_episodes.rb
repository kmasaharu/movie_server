class AddColumnEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :image_url, :string, limit: 1024
  end
end
