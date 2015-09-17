require 'thor'

class Cli < Thor
  include InvokeCall

  desc 'sip', 'place a SIP call'
  option :promo_number, :required => true
  option :ringswitch_node, :required => true
  option :call_scenario, :required => true
  option :client_number

  long_desc <<-DOC
    Uses the pjsip library to place a sip call to a sip number at a specific sip server.
  DOC

  def sip
    audio_card_id   = find_audio_card
    call_scenario   = build_scenario_cmd(options[:call_scenario])
    promo_number    = options[:promo_number]
    ringswitch_node = options[:ringswitch_node]
    client_number   = options[:client_number] || default_number

    system("(#{call_scenario}) | pjsua sip:#{promo_number}@#{ringswitch_node} --log-level=0 --use-cli --id sip:#{client_number}@invoca.com --playback-dev=#{audio_card_id}")
  end
end
