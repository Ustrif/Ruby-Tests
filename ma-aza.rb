# encoding: UTF-8
# gem install colorize 

require "colorize"

class String
  def mavi_yaz
    puts "#{self}".blue
  end
  def kirmizi_yaz
    puts "#{self}".red
  end
  def yesil_yaz
    puts "#{self}".green
  end
  def mor_yaz
    print "#{self}".magenta
  end
end

def dosya_yaz(numara,ad,urun,fiyat,adet)
  File.open("Kayt/#{numara}.txt","a") {|file| file.write("Alıcının adı: #{ad},\nAlınan ürün: #{urun},\nÜrünün fiyatı: #{fiyat},\nÜrünün adeti: #{adet},\nToplam ücret: #{fiyat.to_i * adet.to_i}")}
end

def dosya_oku(numara)
  begin
    file = File.open("Kayt/#{numara}.txt","r")
    veri = file.read
    file.close
    return veri
  rescue
    return "Bu isimde kayıt yok."
  end
end

def dosya_sil(numara)
  begin
    File.delete("Kayt/#{numara}.txt")
  rescue
    return "Bu isimde kayıt yok."
  end
end

END { "Çıkış yapılıyor... Kullandığınız için teşekkür ederiz.".yesil_yaz; sleep 1}

"Market programı açılıyor...".yesil_yaz
sleep 1
"Açıldı. Hoş geldiniz.".yesil_yaz

"1-) Yeni Fiş \n2-) Fiş Görüntüle\n3-) Fiş Düzenle\n4-) Fiş Sil\nq-) Çıkış".mavi_yaz

loop do
  "Seçenek numarası giriniz (1,2,3,4,q): ".mor_yaz
  secenek = gets.chop
  if secenek.to_i == 1
    "Lütfen bekleyin...".yesil_yaz
    sleep 1
    "Adınız nedir?: ".mor_yaz
    ad = gets.chop
    "Ürün nedir?: ".mor_yaz
    urun = gets.chop
    "Fiyatı ne kadar?: ".mor_yaz
    fiyat = gets.chop
    if fiyat.to_i == 0
      "Sadece sayısal veri giriniz.".mavi_yaz
    else
      "Adedi kaç tane?: ".mor_yaz
      adet = gets.chop
      if adet.to_i == 0
        "Sadece sayısal veri giriniz.".mavi_yaz
      else
        toplam_fiyat = adet.to_i * fiyat.to_i
        ("Toplam tutar: "+ toplam_fiyat.to_s).mavi_yaz
        "Kaydedildi.".mavi_yaz
        kayt_numara = ((1..50).to_a.sample.to_s + ("a".."z").to_a.sample + toplam_fiyat.to_s).to_s
        ("Kayıt numarası. Lütfen unutmayın: " + kayt_numara + "\n").mavi_yaz
        dosya_yaz(kayt_numara,ad,urun,fiyat,adet)
      end
    end
  elsif secenek.to_i == 2
    "Lütfen bekleyin...".yesil_yaz
    sleep 1
    "Kayıt numarası nedir? ".mor_yaz
    al_k_numara = gets.chop
    if dosya_oku(al_k_numara) == "Bu isimde kayıt yok."
      "Böyle kayıt numarası yok.".mavi_yaz
    else
      "Dosya içeriği: ".yesil_yaz
      dosya_oku(al_k_numara).mavi_yaz
      puts "\n"
    end

  elsif secenek.to_i == 3
    "Lütfen bekleyin...".yesil_yaz
    sleep 1
    "Kayıt numarası nedir? ".mor_yaz
    al_k_numara = gets.chop
    if dosya_oku(al_k_numara) == "Bu isimde kayıt yok."
      "Böyle kayıt numarası yok.".mavi_yaz
    else
      "Dosya içeriği: ".yesil_yaz
      dosya_oku(al_k_numara).mavi_yaz
      puts "\n"
      "Bilgileri tekrar giriniz.".yesil_yaz
      "Adınız nedir?: ".mor_yaz
      ad = gets.chop
      "Ürün nedir?: ".mor_yaz
      urun = gets.chop
      "Fiyatı ne kadar?: ".mor_yaz
      fiyat = gets.chop
      if fiyat.to_i == 0
        "Sadece sayısal veri giriniz.".mavi_yaz
      else
        "Adedi kaç tane?: ".mor_yaz
        adet = gets.chop
        if adet.to_i == 0
          "Sadece sayısal veri giriniz.".mavi_yaz
        else
          toplam_fiyat = adet.to_i * fiyat.to_i
          ("Toplam tutar: "+ toplam_fiyat.to_s).mavi_yaz
          "Kaydedildi.".mavi_yaz
          dosya_sil(al_k_numara)
          dosya_yaz(al_k_numara,ad,urun,fiyat,adet)
        end
      end
    end
  elsif secenek.to_i == 4
    "Lütfen bekleyin...".yesil_yaz
    sleep 1
    "Kayıt numarası nedir? ".mor_yaz
    al_k_numara = gets.chop
    if dosya_oku(al_k_numara) == "Bu isimde kayıt yok."
      "Böyle kayıt numarası yok.".mavi_yaz
    else
      "Dosya içeriği: ".yesil_yaz
      dosya_oku(al_k_numara).mavi_yaz
      puts "\n"
      "Silmek istediğinize emin misiniz? (E/H) ".mor_yaz
      karar = gets.chop
      loop do
        if karar == "E" or karar == "e"
          dosya_sil(al_k_numara)
          "Dosya silindi.".mavi_yaz
          break
        elsif karar == "H" or karar == "h"
          "İşlem iptal edildi.".yesil_yaz
          break
        else
          "Hatalı tuşlama.".yesil_yaz
          break
        end
      end
    end
  elsif secenek == "q"
    exit
  else
    "Hatalı tuşlama.".mavi_yaz
  end
end
