class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :title_id
      t.string :name
      t.string :url, limit: 1024

      t.timestamps
    end
  end
end
