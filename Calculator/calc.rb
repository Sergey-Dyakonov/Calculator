require './numeric_expression_error'
require './integer_violation_error'
require './format_error'
require './checker'

@operators_pattern = /[+\-\/*]/

def remove_brackets(input)
  if input.include?("(")
    input = input.sub("(", "")
    input = input.sub(")", "")
  end
  input
end

def plank_calc(input)
  input = remove_brackets(input)
  values = input.split(@operators_pattern)
  res = 0
  if input.include? "+"
    res = values[0].to_i + values[1].to_i
  elsif input.include? "-"
    res = values[0].to_i - values[1].to_i
  elsif input.include? "*"
    res = values[0].to_i * values[1].to_i
  elsif input.include? "/"
    res = values[0].to_i / values[1].to_i
  end
  res
end

input = "12+12+12+(12-8)/4*10"
until input =~ /^\d+$/
  if input =~ /\(\d+[+\-\/*]\d+\)/
    input = input.sub(/\(\d+[+\-\/*]\d+\)/, plank_calc(input.match(/\(\d+[+\-\/*]\d+\)/).to_s).to_s)
  elsif input =~ /\d+[\/*]\d+/
    input = input.sub(/\d+[\/*]\d+/, plank_calc(input.match(/\d+[\/*]\d+/).to_s).to_s)
  else
    input = input.sub(/\d+[+\-\/*]\d+/, plank_calc(input.match(/\d+[+\-\/*]\d+/).to_s).to_s)
  end
end
puts input