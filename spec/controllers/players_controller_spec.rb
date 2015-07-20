require 'rails_helper'

describe PlayersController do
  let!(:john) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe') }
  let!(:jane) { User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', phone_number: '555-555-5555', password: '123456', username: 'janedoe') }
  let!(:game) { Game.create(sport: 'Basketball', start_time: '2015-07-13 18:35:57', end_time: '2015-07-13 19:35:57', location: 'Central Park', owner_id: jane.id) }
  let!(:game2) { Game.create(sport: 'Football', start_time: '2015-07-21 18:35:57', end_time: '2015-07-21 19:35:57', location: 'Central Park', owner_id: jane.id) }
  let!(:player) { Player.create(user_id: john.id, game_id: game.id) }
  let!(:player2) { Player.create(user_id: jane.id, game_id: game.id, attending: true) }


  describe "PATCH #status" do
    it "updates attending value to true" do
      session[:user_id] = player.id
      patch :status, invite_id: player, status: 'true', game_id: game.id
      player.reload

      expect(player.attending).to eq(true)
    end

    it "updates attending value to false" do
      session[:user_id] = player2.id
      patch :status, invite_id: player2, status: 'false', game_id: game.id
      player2.reload

      expect(player2.attending).to eq(false)
    end

    it "creates a player (invite) if one doesn't already exist" do
      expect{
        session[:user_id] = john.id
        patch :status, status: 'true', game_id: game2.id
      }.to change(Player, :count).by(1)
    end

    it "should redirect page after update" do
      session[:user_id] = player.id
      patch :status, invite_id: player, status: 'true', game_id: game.id

      expect(response).to redirect_to user_path(player.id)
    end
  end
end
