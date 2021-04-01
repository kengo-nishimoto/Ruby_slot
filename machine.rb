def slot_start()
  puts "コインを何枚入れますか？"
  puts "1(10コイン)2(30コイン)3(50コイン)4(やめておく)"
  bet = gets.chomp.to_i
  
  if bet == 1
    bet_coin = 10
  elsif bet == 2
    bet_coin = 30
  elsif bet == 3
    bet_coin = 50
  elsif bet == 4
    puts "やめておく"
  exit
  end
  
  return bet, bet_coin
end

def slot_reel()
  num1 = Random.rand(1..9)
  num2 = Random.rand(1..9)
  num3 = Random.rand(1..9)
  return num1, num2, num3
end

def per_slot(place, number, coin, bet_coin)
  puts "当たり!!"
  puts "#{place}に#{number}が揃いました"
  coin += bet_coin * 3
  puts "#{bet_coin * 3}枚のコインを獲得"
  puts "現在#{coin}枚持っています"
  puts "---------------"
  per = true
  return coin, per
end