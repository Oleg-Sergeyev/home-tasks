# frozen_string_literal: true

# module Search
module Search
  module_function

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

  def top_left(field, y, x)
    range = ((y - 1)..0)
    range.each do |row|
      p row
      return true if x == 1 || y == 1

      p "right -> #{field[row][(x - 1)].z}"
      y -= 1
      x -= 1
    end
  end

  def diagonal_1(field, y, x)
    range = ((8 - x)..0) if y == 8
    range = (0..(8 - x)) if y == 1
    range.each do |row|
      p "right -> #{field[row][(x - 1)].z}"
      x += 1
    end
  end

  def diagonal_2(field, y, x)
    range = ((x - 1)..0) if y == 8
    range = (0..(x - 1)) if y == 1
    range.each do |row|
      p "left -> #{field[row][(x - 1)].z}"
      x -= 1
    end
  end

  def hv_search_free?(field, y, x)
    if h_search_free?(field, y) == false && v_search_free?(field, x) == false
      false
    else
      true
    end
  end
end
