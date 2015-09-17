require "invoke_call/version"

module InvokeCall
  def self.call_phone_number(promo_number, config, &block)
    ringswitch_node = config['ringswitch_node']
    if config['client_number'].nil?
      client_number = "8055551212"
    else
      client_number = config['client_number'] 
    end
    
    id = `(echo q) | audtool | grep 'Built-in Output'`

    @scenario = ""
    instance_exec(&block)
    catch_output = `(#{@scenario}) | pjsua sip:#{promo_number}@#{ringswitch_node}.ringrevenue.net --log-level=0 --use-cli --id sip:#{client_number}@invoca.com --playback-dev=#{id[2..2]}`
  end
  
  def self.wait(seconds)
    @scenario += "sleep #{seconds}; "
  end
  
  def self.press(tone)
    @scenario += "echo '# #{tone}'; "
  end
end