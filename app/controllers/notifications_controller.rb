class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def notify
    account = ENV["TWILIO_ACCOUNT_SID"]
    auth = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account, auth)
    message = client.messages.create from: '+16319047382', to: '+16314952889', body: 'Learning to send SMS you are.'
    render plain: message.status
    byebug
  end

end