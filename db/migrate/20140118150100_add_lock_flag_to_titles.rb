class AddLockFlagToTitles < ActiveRecord::Migration
  def change
    add_column :titles, :is_locking, :boolean, :default => false
  end
end
