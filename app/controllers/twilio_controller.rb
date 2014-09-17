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
    from.to_s.downcase!

    #number she texted is the number of the person texting their 'girlfriends'    
    girlfriend_responding = MyGirlfriend.find_by number_she_texts: from, is_current_girlfriend: true  
    
    @name = girlfriend_responding.name
    @hometown = girlfriend_responding.hometown
    @fav_food = girlfriend_responding.favorite_food
    @meetting_place = girlfriend_responding.where_we_met
    @turn_ons = girlfriend_responding.what_turns_me_on
    
    # sets the response based on the incoming message

    if body == 'name'
      return_message = @name
    elsif / eat /.match(body) || /food/.match(body) || /dinner/.match(body) || /lunch/.match(body)
      food_responses_array = [
        "I wish I was on the beach with you eating ",
        "Too bad I am sooooo far you sexy man, I would rather be on your couch eating ", 
        "OMG I just ate 10lbs of ", 
        "I don't know how I have such an amazing body considering I always eat ",
        "I wish you were here I just made ", 
        "Do you like"
        ]

      return_message = (food_responses_array.sample) << @fav_food

    elsif /home/.match(body) || /house/.match(body) || /come/.match(body) || /place/.match(body) || /casa/.match(body)
      hometown_responses_array = [
        "I wish you were here with me in ",
        "It is so cold here, I wish you were here to warm me up in ", 
        "Canada is so booooring, I wish I could move in with you. I am so sick of ", 
        "Baby, I feel so alone here, nobody seems to like blond girls with enormous breasts in ", 
        "I miss you sooo much, when will you come to ", 
        "You should do a road trip to ", 
        "None of the guys are as sexy as you in "
      ]
      return_message = (hometown_responses_array.sample) << @hometown
    
    elsif /met/.match(body) || /meet/.match(body) || /first time/.match(body) || /meeting/.match(body)
      meeting_place_responses_array = [
        "Fate brought us together in ", 
        "I don't know what I would do if I had not met you in ", 
        "We were meat for each other otherwise we would have never me in ", 
        "What if we had never met in ", 
        "All I think about is the time we met in ", 
        "When ever I hear Justin Bieber's song 'Baby' I think of you "
      ]
      return_message = (meeting_place_responses_array.sample) << @meetting_place
    
    elsif /hot/.match(body) || /hook up/.match(body) || /turn on/.match(body) || /turn-on/.match(body) || /sex/.match(body) 
      turn_ons_response_array = [
        "I get so hot when I think of you and me ", 
        "Oh baby, I wish we were ", 
        "I get so hot and bothered thinking about ", 
        "I had to confess to my priest that in church all I think about is ", 
        "I love you boo, you are the only one with whom I want to ", 
        "I wish were were on a beach somewhere ", 
        "Does is turn you on as much as I do to "
      ]
      return_message = (turn_ons_response_array.sample) << @turn_ons
    else 

      random_response_array_part_one = [
        "Canada would be so much better if you were here. ", 
        "I miss you sweetie. ",
        "Do you miss me? ", 
        "Haha I was just thinking about you. ",
      ]

      random_response_array_part_two = [
        "When I think of us I am so happy", 
        "You are so funny",
        "OMG you are the best", 
        "I dreamed of you last night", 
        "You are so silly", 
        "I love you boo!", 
        "I love you sweetie", 
        "What did you have for breakfast?"
      ]
      return_message = (random_response_array_part_one.sample) << (random_response_array_part_two.sample)
    end

      happy_emoticon_array = [":)", ":*", ":-)", ":)", ":D", ":o)", ":]", ":3", 
                        ":c)",":>", "=]", "8)", "=)", ":}", ":^)", ":っ)"]
      laugh_emoticon_array = [":-D","8-D", "8D", "x-D", "xD", "X-D", "XD", "=-D", "=D", "=-3", "=3", "B^D"]
    # return message random emoticon adder 
    random_number = Random.new 
    if random_number.rand(1..2) == 1 
      return_message << " "<< (happy_emoticon_array.sample)
    elsif random_number.rand(1..2) == 2
      return_message << " "<< (laugh_emoticon_array.sample) << " "<< (happy_emoticon_array.sample)
    elsif random_number.rand(1..2) == 3
      return_message << " "<< (laugh_emoticon_array.sample) << " "<< (random_response_array_part_two.sample) << " " << (happy_emoticon_array.sample)
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
  end 


end
