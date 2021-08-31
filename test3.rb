# frozen_string_literal: true

def findSol
  psn = [1, 2, 3, 4, 5, 6, 7, 8]
  until validPosition(psn)
    #psn
    psn = psn.sort_by { rand } # shuffle
    #p psn
  end
  arrprint psn
end

def validPosition(psn)
    #p psn
  (0..6).each do |row|
    ((row + 1)..7).each do |col|
    #   p "#{row}:#{col}"
    #   p "#{(row - col).abs} == #{(psn[row] - psn[col]).abs}"
      if (row - col).abs == (psn[row] - psn[col]).abs
        p psn
        p "#{row}:#{col}"
        p "#{(row - col).abs} == #{(psn[row] - psn[col]).abs}"
        return false
      end
    end
  end
  true
end

def arrprint(arr)
  print '['
  ch = 'a'
  arr.each { |itm| print ch, itm, ' '; ch = ch.next }
  print ']'
end

findSol

