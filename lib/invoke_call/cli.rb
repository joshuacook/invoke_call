require 'thor'

module InvokeCall
  class Cli < Thor
    desc 'sip', 'place a SIP call'
    option :promo_number, :required => true
    option :ringswitch_node, :required => true
    option :call_scenario, :required => true
    option :client_number
    long_desc <<-PLACE_SIP_CALL
    Uses the pjsip library to place a sip call to a sip number at a specific sip server.
    PLACE_SIP_CALL
    
		def singleton
			audio_card_id   = InvokeCall.find_audio_card
		  call_scenario   = options[:call_scenario]
		  promo_number    = options[:promo_number]
		  ringswitch_node = options[:ringswitch_node]
      puts call_scenario
		  if options[:client_number].nil?
		    client_number = "8055551212"
		  else
		    client_number = options[:client_number]
		  end
		
			call_scenario = call_scenario.gsub(/wait/,'sleep')
			call_scenario = call_scenario.gsub(/press (\d)/, 'echo "# \1"')
			call_scenario = call_scenario.gsub(/,/, ';')   
			call_scenario += '; echo h'    
			exit_status = system("(#{call_scenario}) | pjsua sip:#{promo_number}@#{ringswitch_node} --log-level=0 --use-cli --id sip:#{client_number}@invoca.com --playback-dev=#{audio_card_id}")
		end
	end
end