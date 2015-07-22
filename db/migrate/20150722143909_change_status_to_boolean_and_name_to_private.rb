class ChangeStatusToBooleanAndNameToPrivate < ActiveRecord::Migration
  def change
    add_column :games, :private, :boolean, default: false
  end
end
