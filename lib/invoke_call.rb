require "invoke_call/version"
require File.dirname(__FILE__) +  "/invoke_call/cli"

module InvokeCall

  def call_phone_number(promo_number, config, &block)
    ringswitch_node = config['ringswitch_node']
    client_number = config['client_number'] || default_number

    audio_card_id = find_audio_card

    @scenario = ""
    instance_exec(&block)
    `(#{@scenario}) | pjsua sip:#{promo_number}@#{ringswitch_node} --log-level=0 --use-cli --id sip:#{client_number}@invoca.com --playback-dev=#{audio_card_id}`
  end

  def wait(seconds)
    @scenario += "sleep #{seconds}; "
  end

  def press(tone)
    @scenario += "echo '# #{tone}'; "
  end

  def find_audio_card
    built_in_audio_card_id = `(echo q) | audtool | grep 'Built-in Output'`
    built_in_audio_card_id[2..2].to_i
  end

  def default_number
    "8055551212"
  end

  def build_scenario_cmd(scenario)
    scenario = scenario.gsub(/wait/,'sleep')
    scenario = scenario.gsub(/press (\d)/, 'echo "# \1"')
    scenario = scenario.tr(',', ';')
    scenario + '; echo h'
  end
end
