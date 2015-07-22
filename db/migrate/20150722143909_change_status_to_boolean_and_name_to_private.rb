class ChangeStatusToBooleanAndNameToPrivate < ActiveRecord::Migration
  def change
    add_column :games, :private_game, :boolean, default: false
  end
end
