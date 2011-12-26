require 'cora'
require 'siri_objects'
require 'pp'
require 'net/http'
require 'rubygems'
require 'xmlsimple'


class SiriProxy::Plugin::Trein < SiriProxy::Plugin
  def initialize(config = {})
    @config = config 
    
    #::Trein.configure do |config|
    #  config.username = @config['username'] 
    #  config.password = @config['password']
    #end 
    #if you have custom configuration options, process them here!
  end
  
  ##http://me%40rodey.nl:nJf4JgCl1rV5tv3TFxyqytJ7GTF2A_eNxpzw7zUPY1iSPAJCAYfslA@webservices.ns.nl/ns-api-stations

  #get the user's location and display it in the logs
  #filters are still in their early stages. Their interface may be modified
  filter "SetRequestOrigin", direction: :from_iphone do |object|
    puts "[Info - User Location] lat: #{object["properties"]["latitude"]}, long: #{object["properties"]["longitude"]}"
    
    #Note about returns from filters:
    # - Return false to stop the object from being forwarded
    # - Return a Hash to substitute or update the object
    # - Return nil (or anything not a Hash or false) to have the object forwarded (along with any 
    #    modifications made to it)
  end 

  listen_for /Train test/i do
    say "I hear you loud and clear!" #say something to the user!
    
     # send a "Preview"
    object = SiriAddViews.new
    object.make_root(last_ref_id)
    answer = SiriAnswer.new("Arrival Times", [
      SiriAnswerLine.new('logo','http://www.sire.nl/media/uploads/ns.gif'),
      SiriAnswerLine.new('text','http://me%40rodey.nl:nJf4JgCl1rV5tv3TFxyqytJ7GTF2A_eNxpzw7zUPY1iSPAJCAYfslA@webservices.ns.nl/ns-api-stations'),
    object.views << SiriAnswerSnippet.new([answer])
    send_object object
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
end