# frozen_string_literal: true

require 'csv'

# class LoadWords
class LoadWords
  def initialize(path)
    Kernel.const_set('ENGRU', eng_file(path))
    # Kernel.const_set('RUENG', ru_file(path))
  end

  def eng_file(name)
    (CSV.read(name).map { |str| str.join.split(';') }).to_h
  end
end
