require './numeric_expression_error'
require './integer_violation_error'

def validate_input(inp)
  inp.chars.each { |c|
    unless c.match(/[+-\/*]|[0-9]/)
      raise NumericExpressionError
    end
  }
  if inp.include? "/0"
    raise ZeroDivisionError
  end
end

def plank_calc(input)
  values = input.split(/[+-\/*]/)
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

puts "Now enter expression with two operands and one of the following operators [+, -, *, /]"
inp = gets.chomp
puts plank_calc(inp)