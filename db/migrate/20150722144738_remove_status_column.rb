class RemoveStatusColumn < ActiveRecord::Migration
  def change
    remove_column :games, :status, :string
  end
end
