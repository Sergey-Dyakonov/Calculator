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

def apply_operation(input)
  input = remove_brackets(input)
  values = input.split(@operators_pattern)
  res = nil
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

#12+12+(12+12-8/2)/4*10
def calculate(input)
  if input =~ /\((.*?)\)/
    exp = input.match(/\((.*?)\)/).to_s
    input = input.sub(exp, calculate(remove_brackets(exp)))
  elsif input =~ /\d+[\/*]\d+/
    input = calculate(input.sub(/\d+[\/*]\d+/, apply_operation(input.match(/\d+[\/*]\d+/).to_s).to_s))
  elsif input =~ /\d+[+-]\d+/
    input = calculate(input.sub(/\d+[+-]\d+/, apply_operation(input.match(/\d+[+-]\d+/).to_s).to_s))
  end
  unless input =~ /^\d+$/
    input = calculate(input)
  end
  input
end

input = "(12+12)*3/(4-2)+(12+12-8/2)/4*10"
puts calculate(input)