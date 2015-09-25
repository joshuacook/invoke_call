#!/usr/bin/env ruby

$REAL_TIME_PROMO       = 8447977431
$BUNDLED_ROUTING_PROMO = 8559778313
$REPEAT_ROUTING_PROMO  = 8442446995
$PRETRANSFER_PROMO     = 8555311227


$campaign = ARGV[1]

if $campaign == "real_time"
  $promo = $REAL_TIME_PROMO
elsif $campaign == "bundled"
  $promo = $BUNDLED_ROUTING_PROMO
elsif $campaign == "repeat"
  $promo = $REPEAT_ROUTING_PROMO
elsif $campaign == "pretransfer"
  $promo = $PRETRANSFER_PROMO
end


if (ARGV[0] == 'random') then 
  while (true) do
    `invoke_call sip --call-scenario='wait 16' --promo-number=#{$promo} --ringswitch-node=54.167.199.55 --client-number=805777#{rand(9999)}`
  end
end

if (ARGV[0] == 'repeat') then
  while (true) do
    numbers = [rand(9999), rand(9999), rand(9999), rand(9999), rand(9999), rand(9999), rand(9999), rand(9999), rand(9999), rand(9999)]
    `invoke_call sip --call-scenario='wait 16' --promo-number=#{$promo} --ringswitch-node=54.167.199.55 --client-number=805777#{numbers[rand(20)]}`
  end
end

