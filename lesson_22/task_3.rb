# frozen_string_literal: true

# class Hash
class Hash
  def str_keys
    new_hash = map do |key, value|
      value_str = if value.instance_of? Hash
                    value.str_keys
                  else
                    value
                  end
      [key.to_s, value_str]
    end
    Hash[new_hash]
  end

  # def symbol_keys
  #   new_hash = map do |key, value|
  #     value_sym = if value.instance_of? Hash
  #                   value.symbol_keys
  #                 else
  #                   value
  #                 end
  #     [key.to_sym, value_sym]
  #   end
  #   Hash[new_hash]
  # end

  def to_json(*_option)
    str_keys.to_s.split('=>').join(':')
  end
end

fst_hash = { date: '2021-10-10', text: 'Good news, good news!!!', name: 'Fantastic news!' }
snd_hash = { date: '2021-10-10',
             data:
               {
                 fst_date: '2021-05-05',
                 snd_date:
                   {
                     thd_date: '2021-10-10',
                     new_date: '2021-10-15'
                   },
                 some_date: '2020-01-01'
               },
             text: 'Good news, good news!!!',
             name: 'Fantastic news!' }

puts "First JSON: #{fst_hash.to_json}"
puts "Second JSON: #{snd_hash.to_json}"
