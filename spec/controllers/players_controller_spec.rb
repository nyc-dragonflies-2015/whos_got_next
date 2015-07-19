require 'rails_helper'

describe PlayersController do
  let!(:john) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe') }
  let!(:jane) { User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', phone_number: '555-555-5555', password: '123456', username: 'janedoe') }
  let!(:game) { Game.create(sport: 'Basketball', start_time: '2015-07-13 18:35:57', end_time: '2015-07-13 19:35:57', location: 'Central Park', owner_id: jane.id) }
  let!(:player) { Player.create(user_id: john.id, game_id: game.id) }
  let!(:player2) { Player.create(user_id: jane.id, game_id: game.id, attending: true) }


  describe "PATCH #status" do
    it "updates attending value to true" do
      patch :status, id: player, status: 'true', user_id: john.id
      player.reload

      expect(player.attending).to eq(true)
    end

    it "updates attending value to false" do
      patch :status, id: player2, status: 'false', user_id: john.id
      player.reload

      expect(player.attending).to eq(false)
    end
  end
end
