# frozen_string_literal: true

# module Search
module Search
 
  module_function

  #@main_diagonals = []
  @diag1 = (1..8).each_with_index.map do |x, index|
    [index + 1, x]
  end

  def search_free_cell(field)
    field.each do |arr|
      arr.each do |obj|
        obj.z = 'W' if obj.z != 'W'
      end
    end
  end

  def h_search_free?(field, y)
    field[y - 1].each do |cell|
      return true if (1..8).include?(cell.z)
    end
    false
  end

  def v_search_free?(field, x)
    (0..7).each do |row|
      return true if (1..8).include?(field[row][x - 1].z)
    end
    false
  end

  def diagonal_search_free?(field, y, x)
    top_left(field, y, x)
    # if y == 1 || y == 8
    #   diagonal_1(field, y, x)
    #   diagonal_2(field, y, x)
    # end
  end

  def diagonal3(field, y, x)
   if (y - x) >= 0
     diagonal_1(field, (8 - y + x), x)

   else
     diagonal_1(field, (8 - y - x), x)
   end

  end

  def top(field, y, x)
    top_left(field, y, x)
    top_right(field, y, x)
  end

  def top_left(field, y, x)
    range = (0..(y - 1)).to_a.reverse
    range.each do |row|
      return true if x < 1 || y < 1

      p "left -> #{field[row][(x - 1)].z}"
      y -= 1
      x -= 1
    end
  end

  def top_right(field, y, x)
    range = (0..(y - 1)).to_a.reverse
    range.each do |row|
      #p row
      return true if x > 8 || y < 1

      p "right -> #{field[row][(x - 1)].z}"
      y -= 1
      x += 1
    end
  end

  # def diagonal_1(main_diagonals)
  #   #get_diagonals(@diag1, :first)
  #   get_diagonals(main_diagonals, @diag1, :second)
  #   #p main_diagonals
  # end

  # def get_diagonals(main_diagonals, array, param)
  #   array1 = diagonals(array, param)
  #   p "array1 = #{array1}"
  #   main_diagonals << array1
  #   p "main_diagonals = #{main_diagonals}"
  #   get_diagonals(main_diagonals, array1, param) if array1.size > 1
  # end

  # def diagonals(array, param)
  #   arr1 = []
  #   array.pop
  #   # if param == :first
  #   #   array.each do |arr|
  #   #     arr1 << [arr[0], arr[1] += 1]
  #   #   end
  #   # elsif param == :second
  #     array.each do |arr|
  #       arr1 << [arr[0] += 1, arr[1]]
  #       #p arr1
  #     end
  #   # end
  #   arr1
  # end

  def diagonal_2(field, y, x)
    range = ((x - 1)..0) if y == 8
    range = (0..(x - 1)) if y == 1
    range.each do |row|
      p "left -> #{field[row][(x - 1)].z}"
      x -= 1
    end
  end

  # def diagonals(field)
  #   p diagonal_1(field)
  # end

  def hv_search_free?(field, y, x)
    if h_search_free?(field, y) == false && v_search_free?(field, x) == false
      false
    else
      true
    end
  end
end
