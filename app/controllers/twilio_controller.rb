class TwilioController < ApplicationController
require 'twilio-ruby' 
  # sends the message

  # route for outbound and inbound Twilio messages 
  # corresponds to get '/twilio_reply' => 'twilio#reply' in routes.rb 
  def reply 
    # determines which message is sent

    #Twilio messages have a body, to, and from, section in params.
    from = params[:From]
    body = params[:Body]

    #the response is based on the received text 
    body.to_s.downcase!

    #number she texted is the number of the person texting their 'girlfriends'    
    girlfriend_responding = MyGirlfriend.find(3)
    
    @name = girlfriend_responding.name
    @hometown = girlfriend_responding.hometown
    @fav_food = girlfriend_responding.favorite_food
    @meetting_place = girlfriend_responding.where_we_met
    @turn_ons = girlfriend_responding.what_turns_me_on
    
    # sets the response based on the incoming message

    if body == 'name'

    if else body == 'food'
      return_message = @favorite_food
    if else body == 'home'
      return_message = @home
    if else body == 'meet'
      return_message = @meetting_place
    if else body == 'turn_on'
      return_message = @turn_ons
    else 
      return_message = "I love you boo!"
    end

    # put your own credentials here 
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
     
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+14378002730', 
      :to => '+17149152596', 
      :body => return_message,  
    })

    render json: incomming_message_body


  end 


end
