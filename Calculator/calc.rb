require './NumericExpressionError'

def plank_calc(input)
  values = input.split(/[+-\/*]/)
  res=0
  if input.include? "+"
    values.each { |val|
      res += val.to_i
    }
  elsif input.include? "-"
    res = values[0].to_i
    (1...values.length).each { |i|
      res -= values[i].to_i
    }
  elsif input.include? "*"
    res = 1
    values.each { |val|
      res *= val.to_i
    }
  elsif input.include? "/"
    res = values[0].to_i
    (1...values.length).each { |i|
      res /= values[i].to_i
    }
  end
  res
end
puts plank_calc("12+1")
puts plank_calc("12-2")
puts plank_calc("12*2")
puts plank_calc("12/2")

# input = gets.chomp
# puts input
# puts input.match(/\d+[+-\\*\/]\d+/)
# puts input.sub! input.match(/\d+[+-\\*\/]\d+/), plankCalc(input)