require './numeric_expression_error'
require './integer_violation_error'
require './format_error'

@operators_pattern = /[+\-\/*]/

def check_int(inp)
  values = inp.split(@operators_pattern)
  values.each { |val|
    if val =~ /\d+[.,]\d+/
      raise IntegerViolationError
    end
  }
end

def check_chars(inp)
  inp.chars.each { |c|
    unless c =~ /[+\-\/*()]|[0-9]/
      raise NumericExpressionError
    end
  }
end

def check_zero_division(inp)
  if inp.include? "/0"
    raise ZeroDivisionError
  end
end

def check_format(inp)
  unless inp =~ /^(\(?\d+[+\-\/*]\d+\)?)$/
    raise FormatError
  end
  if inp.include?("(") && !inp.include?(")") ||
    inp.include?(")") && !inp.include?("(")
    raise FormatError
  end
end

def validate_input(inp)
  check_format(inp)
  check_int(inp)
  check_zero_division(inp)
  check_chars(inp)
end

def plank_calc(input)
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

puts "Tests:"
puts "12+2=#{plank_calc("12+2")}"
puts "12-2=#{plank_calc("12-2")}"
puts "12*2=#{plank_calc("12*2")}"
puts "12/2=#{plank_calc("12/2")}"
