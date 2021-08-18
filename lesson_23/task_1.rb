# frozen_string_literal: true

# require_relative 'lib/samecubes'
require_relative 'lib/figures'

# class Object
class Object
  @@figures = Figures.new

  def cube
    @@figures.add(self)
  end
end

# coordinates1 = [[0, 1, 0], [2, 1, 0], [2, 3, 0], [0, 3, 2]]
# coordinates4 = [[0, 1, 0], [2, 1, 0], [2, 3, 0], [0, 3, 2]]
# coordinates2 = [[-3, -1, 0], [-1, -1, 0], [-1, 1, 0], [-3, 1, 2]]
# coordinates3 = [[0, -3, 0], [3, -3, 0], [3, 0, 0], [0, 0, 3]]
# p Cube.new(coordinates1)
# p Cube.new(coordinates2)
# p Cube.new(coordinates3)
# p Cube.new(coordinates4)

[[0, 1, 0], [2, 1, 0], [2, 3, 0], [0, 3, 2]].cube
[[0, 1, 0], [2, 1, 0], [2, 3, 0], [0, 3, 2]].cube        # same cube
[[-3, -1, 0], [-1, -1, 0], [-1, 1, 0], [-3, 1, 2]].cube
[[0, -3, 0], [3, -3, 0], [3, 0, 0], [0, 0, 3]].cube
[[0, -3, 0], [3, -3, 0], [3, 0, 0], [0, 0, 3]].cube
@@figures.objects.each { |cube| p cube }
