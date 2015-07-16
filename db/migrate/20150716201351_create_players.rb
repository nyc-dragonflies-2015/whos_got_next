class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :user
      t.references :game
      t.boolean :attending, default: false

      t.timestamps null: false
    end
  end
end
