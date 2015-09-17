require "invoke_call/version"

module InvokeCall
  def self.call_phone_number(promo_number, config, &block)
    ringswitch_node = config['ringswitch_node']
    if config['client_number'].nil?
      client_number = "8055551212"
    else
      client_number = config['client_number'] 
    end
    
    audio_card_id = find_audio_card
    
    @scenario = ""
    instance_exec(&block)
    `(#{@scenario}) | pjsua sip:#{promo_number}@#{ringswitch_node} --log-level=0 --use-cli --id sip:#{client_number}@invoca.com --playback-dev=#{audio_card_id}`
  end
  
  def self.wait(seconds)
    @scenario += "sleep #{seconds}; "
  end
  
  def self.press(tone)
    @scenario += "echo '# #{tone}'; "
  end
  
  def self.find_audio_card
    built_in_audio_card_id = `(echo q) | audtool | grep 'Built-in Output'`
    built_in_audio_card_id[2..2].to_i
  end
  
  def self.cli(promo_number, client_number, ringswitch_node, cli_scenario)
    audio_card_id = find_audio_card
    
    cli_scenario = cli_scenario.gsub(/wait/,'sleep')
    cli_scenario = cli_scenario.gsub(/press (\d)/, 'echo "# \1"')
    cli_scenario = cli_scenario.gsub(/,/, ';')   
    cli_scenario += '; echo h'    
    exit_status = system("(#{cli_scenario}) | pjsua sip:#{promo_number}@#{ringswitch_node} --log-level=0 --use-cli --id sip:#{client_number}@invoca.com --playback-dev=#{audio_card_id}")
  end
end