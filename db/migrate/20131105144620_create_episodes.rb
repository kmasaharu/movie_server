class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :title_id
      t.text :name
      t.text :url

      t.timestamps
    end
  end
end
