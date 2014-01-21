class AddIsBroadcastingToTitles < ActiveRecord::Migration
  def change
    add_column :titles, :is_broadcasting, :boolean, :default => false
  end
end
