class TwilioController < ApplicationController
require 'twilio-ruby' 

  # determines which message is sent
  def replyGenerator

  end 

  # sends the message 
  def send(return_message, number_she_texts)
    # put your own credentials here 
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
     
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+14378002730', 
      :to => number_she_texts, 
      :body => return_message,  
    })
  end 


end
