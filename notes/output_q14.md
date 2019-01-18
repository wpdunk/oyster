Williams-MacBook-Pro:oyster wpdunk$ irb
2.6.0 :001 > require './feature_test.rb'
 => true
2.6.0 :002 > Oyster = Oystercard.new
 => #<Oystercard:0x00007faf3983eec0 @balance=0, @journey=#<Journey:0x00007faf3983ee98 @journey_list=[]>>
2.6.0 :003 > Peckham = Station.new("peckham", 2)
 => #<Station:0x00007faf3b070048 @name="peckham", @zone=2>
2.6.0 :004 > Waterloo = Station.new("waterloo", 1)
 => #<Station:0x00007faf39856020 @name="waterloo", @zone=1>
2.6.0 :005 > Peckham
 => #<Station:0x00007faf3b070048 @name="peckham", @zone=2>
2.6.0 :006 > Oyster.topup(100)
Traceback (most recent call last):
        5: from /Users/wpdunk/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/wpdunk/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/wpdunk/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):6
        1: from /Users/wpdunk/Makers/Week2/oyster/lib/oystercard.rb:15:in `topup'
RuntimeError (max amount reached)
2.6.0 :007 > Oyster.topup(50)
 => 50
2.6.0 :008 > Oyster.add(10)
Traceback (most recent call last):
        4: from /Users/wpdunk/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/wpdunk/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/wpdunk/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):8
NoMethodError (private method `add' called for #<Oystercard:0x00007faf3983eec0>)
2.6.0 :009 > Oyster.touch_in(Peckham)
2.6.0 :010 > Oyster.touch_out(Waterloo)
2.6.0 :011 > Oyster.touch_in(Peckham)
2.6.0 :012 > Oyster.touch_out(Waterloo)
2.6.0 :013 > Oyster.balance
 => 48
2.6.0 :014 > Oyster.touch_out(Waterloo)
2.6.0 :015 > Oyster.balance
 => 42
2.6.0 :016 > Oyster.touch_in(Peckham)
2.6.0 :017 > Oyster.touch_out(Waterloo)
2.6.0 :018 > Oyster.balance
 => 41
2.6.0 :019 > Oyster.touch_in(Peckham)
2.6.0 :020 > Oyster.balance
 => 41
2.6.0 :021 > Oyster.touch_in(Peckham)
2.6.0 :022 > Oyster.balance
 => 35
2.6.0 :023 > Oyster.touch_in(Peckham)
2.6.0 :024 > Oyster.balance
 => 29
2.6.0 :025 > Oyster.touch_out(Waterloo)
2.6.0 :026 > Oyster.touch_in(Peckham)


[{:entry_station=>#<Station:0x00007faf3b070048 @name="peckham", @zone=2>, :exit_station=>#<Station:0x00007faf39856020 @name="waterloo", @zone=1>},  10
 {:entry_station=>#<Station:0x00007faf3b070048 @name="peckham", @zone=2>, :exit_station=>#<Station:0x00007faf39856020 @name="waterloo", @zone=1>},  12
 {:entry_station=>#<Station:0x00007faf3b070048 @name="peckham", @zone=2>, :exit_station=>#<Station:0x00007faf39856020 @name="waterloo", @zone=1>},  17
 {:entry_station=>#<Station:0x00007faf3b070048 @name="peckham", @zone=2>},                                                                          19
 {:entry_station=>#<Station:0x00007faf3b070048 @name="peckham", @zone=2>},                                                                          21
 {:entry_station=>#<Station:0x00007faf3b070048 @name="peckham", @zone=2>, :exit_station=>#<Station:0x00007faf39856020 @name="waterloo", @zone=1>},  25
 {:entry_station=>#<Station:0x00007faf3b070048 @name="peckham", @zone=2>}]



 2.6.0 :006 > Oyster.touch_in(Peckham)
 2.6.0 :007 > Oyster.touch_out(Waterloo)

 2.6.0 :008 > Oyster.touch_in(Peckham)
 2.6.0 :009 > Oyster.touch_out(Waterloo)

 2.6.0 :010 > Oyster.touch_out(Waterloo)
  => [

  {:entry_station=>#<Station:0x00007fa37d16eb58 @name="peckham", @zone=2>, :exit_station=>true},
  {:entry_station=>"n/a", :exit_station=>#<Station:0x00007fa37d1a1698 @name="waterloo", @zone=1>},
  {:entry_station=>#<Station:0x00007fa37d16eb58 @name="peckham", @zone=2>, :exit_station=>true},
  {:entry_station=>"n/a", :exit_station=>true},
  {:entry_station=>"n/a", :exit_station=>#<Station:0x00007fa37d1a1698 @name="waterloo", @zone=1>}]

   => [
   {:entry_station=>#<Station:0x00007fa7420adde0 @name="peckham", @zone=2>, :exit_station=>#<Station:0x00007fa7420e02b8 @name="waterloo", @zone=1>}, {:entry_station=>#<Station:0x00007fa7420adde0 @name="peckham", @zone=2>, :exit_station=>#<Station:0x00007fa7420e02b8 @name="waterloo", @zone=1>}, {:entry_station=>"n/a", :exit_station=>#<Station:0x00007fa7420e02b8 @name="waterloo", @zone=1>}]

    => [
    {:entry_station=>#<Station:0x00007fa7420adde0 @name="peckham", @zone=2>, :exit_station=>#<Station:0x00007fa7420e02b8 @name="waterloo", @zone=1>}, {:entry_station=>#<Station:0x00007fa7420adde0 @name="peckham", @zone=2>, :exit_station=>#<Station:0x00007fa7420e02b8 @name="waterloo", @zone=1>}, {:entry_station=>"n/a", :exit_station=>#<Station:0x00007fa7420e02b8 @name="waterloo", @zone=1>},
    {:entry_station=>#<Station:0x00007fa7420adde0 @name="peckham", @zone=2>, :exit_station=>#<Station:0x00007fa7420e02b8 @name="waterloo", @zone=1>}, {:entry_station=>#<Station:0x00007fa7420adde0 @name="peckham", @zone=2>},
    {:entry_station=>#<Station:0x00007fa7420adde0 @name="peckham", @zone=2>, :exit_station=>#<Station:0x00007fa7420e02b8 @name="waterloo", @zone=1>}, {:entry_station=>#<Station:0x00007fa7420adde0 @name="peckham", @zone=2>}] 









                                                                          26
