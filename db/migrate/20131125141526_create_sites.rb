class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :site_name
      t.string :site_url, limit: 1024

      t.timestamps
    end
  end
end
