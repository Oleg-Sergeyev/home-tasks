# frozen_string_literal: true

def encode(str)
  #puts str
  charset = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z ! @ \ # $ % ^ & * ( ) _ + -]
  arr = []
  p str.split('')
  str.split('').each do |l|
    (0...4).map { charset.to_a[rand(charset.size)] }.join
    arr.push(l)
  end
  arr.join
  #array = (0...128).map { charset.to_a[rand(charset.size)] }.join
  #array
end

def generate_activation_code(size = 6)
  charset = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  (0...size).map { charset.to_a[rand(charset.size)] }.join
end

def encode_new(str)
  
  str.scan(/.{1,4}/m).each do |word|
    digits_count = []
    #puts l.hash #- 555
    puts word.each_byte.to_a.pack('C*').force_encoding('UTF-8')
    #str1 = word.each_byte.to_a.join.to_i - 1_111_111_111
    str1 = word.each_byte.to_a.join
    #p str1.to_s(16)
    #p (str1.to_i + 1_111_111_111).to_s

    # puts (word.each_byte.to_a.join.to_i - 1111111111).to_s(16)
    # puts word.each_byte.to_a.join.to_i.to_s(16)
    word.each_byte.to_a.each do |a|
      puts a
      
      #p (a - 1).to_s(16)
    end
    word.each_byte.to_a.each do |s|
      digits_count << s.digits.count
    end
    str3 = "#{str1}#{digits_count.join}"
    puts str3.split(//).last(4).to_s
  end
  #puts digits_count.join.to_i
end

p encode_new('This is a new string')

# puts encode('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
# puts encode('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb')
# puts encode("!@\#$%^&*()_+-")
# a = ''
# b = ''
# c = ''

# ('a'..'z').each do |l|
#   a += encode("#{l}")[0]
#   b += encode("_#{l}")[1]
#   c += encode("__#{l}")[2]
#   #puts encode(l.to_s)[0]
# end

# puts a
# puts b
# puts c
