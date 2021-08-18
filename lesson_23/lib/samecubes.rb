# frozen_string_literal: true

# module SameCube
module SameCube
  @@cubes = []
  def self.included(klass)
    klass.class_exec do
      def initialize(coordinates)
        unless @@cubes.empty?
          @@cubes.each do |cube|
            raise 'The same cube' if cube == coordinates
          end
        end
        @@cubes << coordinates
      end
    end
  end
end
