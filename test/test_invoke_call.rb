require 'minitest/autorun'
require 'invoke_call'

class InvokeCallTest < Minitest::Test
  def test_find_audio_card
    assert_output(/\d\n/){puts InvokeCall.find_audio_card}
  end
  
  def test_cli
    skip
    assert_silent {InvokeCall.cli("8555550053","8055551212","staging-collapsed-jc1.ringrevenue.net","wait 5, press 1, wait 5")}
  end
end 