class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :title_id
      t.integer :count

      t.timestamps
    end
  end
end
