require "twiliolib.rb"

# @start snippet
# your Twilio authentication credentials
ACCOUNT_SID = 'AC3428bd048e76d94c7c325980115bbcc9'
ACCOUNT_TOKEN = '64e5c64955c6b9e1d68f0a9f58b0944b'

# version of the Twilio REST API to use
API_VERSION = '2010-04-01'

# base URL of this application
BASE_URL = "http://localhost:3000/recordings" #"http://vivid-night-24.heroku.com/phonecalls"      

# Outgoing Caller ID you have previously validated with Twilio
CALLER_ID = '6158525397'   

class RecordingsController < ApplicationController
    before_filter :authenticate_user!, :except => [:show, :index]  
    respond_to :html, :xml  

    def create
      @recording = current_user.recordings.build(params[:recording])
             if @recording.save
               flash[:success] = "Recording created!"
               redirect_to root_path
             else 
               render 'root'
             end             
    end
    
    def show
      @recording = Recording.find(params[:id])  
      @title = ( "View " + @recording.user.name.pluralize + " Recording" )
      
      
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @recording }
      end
    end
    
    def makecall  #New
    
      # parameters sent to Twilio REST API
      d = {
          'From' => CALLER_ID,
          'To' => current_user[:phone_number],
          'Url' => BASE_URL + '/trunk.xml',
          'Timeout' => '15',
      }              
    
      #begin
        # account = Twilio::RestAccount.new(ACCOUNT_SID, ACCOUNT_TOKEN)
        #       resp = account.request(
        #           "/#{API_VERSION}/Accounts/#{ACCOUNT_SID}/Calls",
        #           'POST', d)      
        #       resp.error! unless resp.kind_of? Net::HTTPSuccess      
    
      # save initial form and callid to database
      #resp = Hash.from_xml(resp.body)
      resp2 = "324234wer" # resp['TwilioResponse']['Call']['Sid']   
      ourform = { :call_id => resp2}                         
      @recording = current_user.recordings.build(params[:recording])
      @recording[:call_id] = resp2
      if @recording.save             
        flash[:success] = "Calling #{ current_user.phone_number }... "
        redirect_to words_path
      end
    end          
end
