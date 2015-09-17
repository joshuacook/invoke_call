require 'minitest/autorun'
require 'invoke_call'
require 'pry'

class InvokeCallTest < Minitest::Test
  def test_find_audio_card
    cli = Cli.new
    assert_output(/\d\n/){puts cli.find_audio_card}
  end

  def test_cli
    skip
    assert_silent { Cli.new("8555550053" , "8055551212" , "staging-collapsed-jc1.ringrevenue.net" , "wait 5 ,  press 1 ,  wait 5") }
  end
end
