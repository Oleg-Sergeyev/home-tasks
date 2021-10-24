# frozen_string_literal: true

# module For
module For
  def self.my_cycle(args, array, &block)
    if args
      args.times do
        array_each(array, &block)
      end
    else
      loop { block.call(array_each(array, &block)) }
    end
    nil
  end

  def self.array_each(array, &block)
    array.concat(array).each do |val|
      block.call(val)
    end
  end
end
