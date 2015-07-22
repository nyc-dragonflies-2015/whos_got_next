class Notification
  def self.notify(user, message)
    account = ENV['TWILIO_ACCOUNT_SID']
    auth = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account, auth)
    message = client.messages.create(from: '+16312237553', to: '+1' + user.phone_number, body: message)
  end

  def self.game_invite_msg(user, game)
    owner = User.find(game.owner_id)
    return "Hello #{user.full_name}, you have been invited by #{owner.full_name} to play #{game.sport} at #{game.location}, from #{game.start_time} to #{game.end_time}."
  end
end
