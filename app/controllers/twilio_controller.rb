class TwilioController < ApplicationController
require 'twilio-ruby' 
  # sends the message 
  def reply 
    # determines which message is sent

    #Twilio messages have a body, to, and from, section in params.
    to = params[:To]
    from = params[:From]
    body = params[:Body]

    #number she texted is the number of the person texting their 'girlfriends'    
    @girlfriend_responding = MyGirlfriend.find_by_number_she_texts(from)

    
  
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
