# frozen_string_literal: true

# module Search
module Search
  module_function

  # @main_diagonals = []
  # @diag1 = (1..8).each_with_index.map do |x, index|
  #   [index + 1, x]
  # end

  def search_free_cell(field)
    field.each do |arr|
      arr.each do |obj|
        obj.z = 'W' if obj.z != 'W'
      end
    end
  end

  def h_search_free?(field, y)
    field[y - 1].each do |cell|
      return 1 if (1..8).include?(cell.z)
    end
    0
  end

  def v_search_free?(field, x)
    (0..7).each do |row|
      return 1 if (1..8).include?(field[row][x - 1].z)
    end
    0
  end

  # def diagonal_search_free?(field, y, x)
  #   top_left(field, y, x)
  #   # if y == 1 || y == 8
  #   #   diagonal_1(field, y, x)
  #   #   diagonal_2(field, y, x)
  #   # end
  # end

  # def diagonal3(field, y, x)
  #  if (y - x) >= 0
  #    diagonal_1(field, (8 - y + x), x)

  #  else
  #    diagonal_1(field, (8 - y - x), x)
  #  end

  # end

  def recursive_search(field, y, x)
    # p "#{y}:#{x}"
    err = []
    err << v_search_free?(field, x)
    err << h_search_free?(field, y)
    # err << hv_search_free?(field, y, x)
    err << top_left(field, y, x)
    err << top_right(field, y, x)
    err << down_right(field, y, x)
    err << down_left(field, y, x)
    return true if err.sum.zero?
  end

  def top_left(field, y, x)
    return 0 if x == 1

    y -= 1
    x -= 1
    range = (0..(y - 1)).to_a.reverse
    range.each do |row|
      return 0 if x < 1 || y < 1

      return 1 if (1..8).include?(field[row][(x - 1)].z)

      # p "top_left -> #{field[row][(x - 1)].z}"
      y -= 1
      x -= 1
    end
    0
  end

  def down_right(field, y, x)
    return 0 if x == 8 || y == 8

    y += 1
    x += 1
    range = ((y - 1)..8).to_a
    range.each do |row|
      return 0 if x > 8 || y > 8

      return 1 if (1..8).include?(field[row][(x - 1)].z)

      # p "down_right -> #{field[row][(x - 1)].z}"
      y += 1
      x += 1
    end
    0
  end

  def top_right(field, y, x)
    return 0 if x == 8

    y -= 1
    x += 1
    range = (0..(y - 1)).to_a.reverse
    range.each do |row|
      # p row
      return 0 if x > 8 || y < 1

      return 1 if (1..8).include?(field[row][(x - 1)].z)

      # p "top_right -> #{field[row][(x - 1)].z}"
      y -= 1
      x += 1
    end
    0
  end

  def down_left(field, y, x)
    return 0 if x == 1 || y == 8

    y += 1
    x -= 1
    range = ((y - 1)..8).to_a
    range.each do |row|
      return 0 if x < 1 || y > 8

      return 1 if (1..8).include?(field[row][(x - 1)].z)

      # p "down_left -> #{field[row][(x - 1)].z}"
      y += 1
      x -= 1
    end
    0
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

  # def diagonal_2(field, y, x)
  #   range = ((x - 1)..0) if y == 8
  #   range = (0..(x - 1)) if y == 1
  #   range.each do |row|
  #     p "left -> #{field[row][(x - 1)].z}"
  #     x -= 1
  #   end
  # end

  # def diagonals(field)
  #   p diagonal_1(field)
  # end

  def hv_search_free?(field, y, x)
    if h_search_free?(field, y).zero? && v_search_free?(field, x).zero?
      0
    else
      1
    end
  end
end
