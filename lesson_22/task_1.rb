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
    users.each do |group|
      block.call(group)
    end
  end

  def each_user(&block)
    users.each do |group|
      group.each do |user|
        block.call(user)
      end
    end
  end

  def each_user_with_index(&block)
    users.each_with_index do |val, index|
      val.each do |user|
        block.call(user, index)
      end
    end
  end
end

# class User
class User
  include Enumerable
  attr_accessor :id, :surname, :name, :patronimyc, :group, :role

  def initialize(args)
    @id, @surname, @name, @patronimyc, @group, @role = *args
  end

  def each
    yield "User: #{id} #{surname} #{name} #{patronimyc} #{group} #{role}"
  end
end

file = File.read('./web_users.json')
data_hash = JSON.parse(file)

fst_group = Group.new(data_hash)
# p fst_group
# fst_group.each { |group| p group }
# fst_group.each_user { |user| p user }
# fst_group.each_with_index { |group, index| p "'#{index}' #{group}" }
p fst_group.group_name
fst_group.each_user_with_index { |user, index| p "#{index} #{user}" }
