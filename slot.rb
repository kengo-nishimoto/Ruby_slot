require "./machine"

coin = 100
per = false
game_round = 1

puts "残りコイン数#{coin}"

while game_round == 1
  bet_coin = 0
  bet, bet_coin = slot_start()
  
 while bet == 0 || bet >= 5 || coin < bet_coin
    if bet == 0 || bet >= 5
      puts "1-4で選んでください"
    else
      puts "現在#{coin}コインを持っています"
      puts "コインが足りません"
    end
    bet, bet_coin = slot_start()
 end
  
  coin -= bet_coin
  puts "----------"
  puts "エンターを３回押してください"
  
  slot_top = [0, 0, 0]
  slot_center = [0, 0, 0]
  slot_bottom = [0, 0, 0]
  
for i in 1..3 do
    key = STDIN.gets
  while key !="\n"
  end
  if (key == "\n")
    slot_top[i-1], slot_center[i-1], slot_bottom[i-1] = slot_reel()
    if i == 1
      puts ("|#{slot_top[0]}| | |")
      puts ("|#{slot_center[0]}| | |")
      puts ("|#{slot_bottom[0]}| | |")
    elsif i == 2
      puts ("|#{slot_top[0]}|#{slot_top[1]}| |")
      puts ("|#{slot_center[0]}|#{slot_center[1]}| |")
      puts ("|#{slot_bottom[0]}|#{slot_bottom[1]}| |")
    elsif i == 3
      puts ("|#{slot_top[0]}|#{slot_top[1]}|#{slot_top[2]}|")
      puts ("|#{slot_center[0]}|#{slot_center[1]}|#{slot_center[2]}|")
      puts ("|#{slot_bottom[0]}|#{slot_bottom[1]}|#{slot_bottom[2]}|")
    end
    puts "----------"
  end
end

if [slot_top[0], slot_top[1], slot_top[2]].uniq.count == 1
  coin, per = per_slot("上段", slot_top[0], coin, bet_coin)
end
if [slot_center[0], slot_center[1], slot_center[2]].uniq.count == 1
  coin, per = per_slot("真ん中", slot_center[0], coin, bet_coin)
end
if [slot_bottom[0], slot_bottom[1], slot_bottom[2]].uniq.count == 1
  coin, per = per_slot("下段", slot_bottom[0], coin, bet_coin)
end
if per == false
  puts "残念"
  puts "残りコイン数#{coin}"
  if coin < 10
  puts "残りコイン数#{coin}"
  puts "コインがなくなりました"
  exit
  end
end
end