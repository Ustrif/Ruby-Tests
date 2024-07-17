puts "*** Sayı Tahmin Oyunu ***"
puts "Hoşgeldiniz. 1 ile 100 arasında (1 ve 100 dahil) rastgele tahmin edin."
hak = 10
rsay = (1..100).to_a.sample

loop do
  print "Tahmininizi giriniz: "
  deneme = gets.chomp.to_i

  if deneme == rsay && hak > 0
    puts "Tahmininiz doğru. Tebrikler. Sayı #{rsay.to_i} idi."
    break

  elsif deneme > rsay && hak > 0
    hak -= 1
    puts "Tahmininiz rastgele sayıdan büyüktür. Kalan hakkkınız: #{hak}"

  elsif deneme < rsay && hak > 0
    hak -= 1
    puts "Tahmininiz rastgele sayıdan küçüktür. Kalan hakkınız: #{hak} "

  else
    puts "Hakkınız bitmiştir. Sayı #{rsay.to_i} olacaktı."
    break
  end
end

puts "Oynadığınız için teşekkürler."
