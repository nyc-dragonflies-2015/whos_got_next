class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :type
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.references :owner

      t.timestamps null: false
    end
  end
end
