class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :sport, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.string :location, null: false
      t.references :owner

      t.timestamps null: false
    end
  end
end
