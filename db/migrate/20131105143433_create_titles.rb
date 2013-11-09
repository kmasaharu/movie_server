class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.integer :favorite_count

      t.timestamps
    end
  end
end
