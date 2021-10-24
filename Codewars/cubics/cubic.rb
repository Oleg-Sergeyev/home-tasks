# frozen_string_literal: true

def sum_of_cubes(str)
  res = str.scan(/\d{1,3}/).map(&:to_i).select { |num| num == num.digits.reduce(0) { |sum, v| sum + v**3 } }
  res.empty? ? 'Unlucky' : "#{(res << res.sum).join(' ')} Lucky"
end

strings = ['n_kj 0f3178.jd(kd)(153.fb372m1,9845112 0455-erjk1',
           '0 9026315 -827&()',
           'aqdf&0#1xyz!22[153(777.777',
           'Once 1000upon a 1000midnight dreary, while100 I pondered, 9026315weak and weary -827&()',
           '&z _upon 407298a --- ???ry, ww/100 I thought, 631str*ng and w===y -721&()',
           '000000aloquit 137z&-and 9926315strong weary']

strings.each { |string| puts sum_of_cubes(string) }
