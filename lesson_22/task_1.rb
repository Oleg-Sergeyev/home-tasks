# frozen_string_literal: true

require 'json'

# class Group
class Group
  include Enumerable
  attr_accessor :group_name, :users

  def initialize(args)
    @users = []
    create_group(args)
  end

  def create_group(args)
    args.each do |k, v|
      group = []
      group << k
      v.each do |key, value|
        group << value
        @group_name = value if key == 'group'
      end
      users << User.new(group)
    end
  end

  def each(&block)
    users.each(&block)
  end

  def each_user_with_index(&_block)
    users.each_with_index do |val, index|
      yield "#{index + 1} #{val}"
    end
  end
end

# class User
class User
  attr_accessor :id, :surname, :name, :patronimyc, :group, :role

  def initialize(args)
    @id, @surname, @name, @patronimyc, @group, @role = *args
  end

  def to_s
    "User: #{id} #{surname} #{name} #{patronimyc} #{group} #{role}"
  end
end

file = File.read('./web_users.json')
data_hash = JSON.parse(file)

fst_group = Group.new(data_hash)
# p fst_group
# fst_group.each { |group| p group }
p fst_group.group_name
fst_group.each_user_with_index { |user, index| puts "#{index} #{user}" }
