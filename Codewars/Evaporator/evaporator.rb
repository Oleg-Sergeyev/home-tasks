# frozen_string_literal: true

def evaporator(content, evap_per_day, threshold)
  threshold_ml = (content.to_f * threshold) / 100
  (1..nil).reduce(content) do |sum, day|
    return day unless (sum -= (evap_per_day * sum.to_f / 100)) > threshold_ml

    sum
  end
end

p evaporator(10, 10, 5)

# Other solutions

# def evaporator(content, percentage, threshold)
#   Math.log(threshold/100.0, 1-percentage/100.0).ceil
# end

# def evaporator(c, e, t, o = c, s = 0)
#   c < t*0.01*o ? s : evaporator(c*(1-0.01*e), e, t, o, -~s)
# end

# def evaporator(content, evap_per_day, threshold)
#   day, percent = 1, 100
#   day += 1 while (percent -= percent*evap_per_day/100.0) > threshold
#   return day
# end
