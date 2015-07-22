class ChangeStatusToBooleanAndNameToPrivate < ActiveRecord::Migration
  def change
    change_column :games, :status, :private, default: false
  end
end
