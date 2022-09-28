require './numeric_expression_error'
require './integer_violation_error'
require './format_error'
require './checker'

def remove_brackets(input)
  if input.include?("(")
    input = input.sub(/^\(/, "")
    input = input.sub(/\)$/, "")
  end
  input
end

def apply_operation(input)
  input = remove_brackets(input)
  values = input.split(/[+\-\/*]/)
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

def extract_bracket_exp(exp)
  open = 0
  close = 0
  index = 0
  first_bracket = 0
  exp.chars.each { |c|
    if c == "("
      if open == 0
        first_bracket = index
      end
      open += 1
    elsif c == ")"
      close += 1
    end
    if open != 0 && close != 0 && open - close == 0
      break
    end
    index += 1
  }
  exp[first_bracket..index]
end

def calculate(input)
  if input =~ /\(/
    exp = extract_bracket_exp(input)
    input = input.sub(exp, calculate(remove_brackets(exp)))
  elsif input =~ /\d+[\/*]\d+/
    input = calculate(input.sub(/\d+[\/*]\d+/, apply_operation(input.match(/\d+[\/*]\d+/).to_s).to_s))
  elsif input =~ /\d+[+-]\d+/
    input = calculate(input.sub(/\d+[+-]\d+/, apply_operation(input.match(/\d+[+-]\d+/).to_s).to_s))
  end
  unless input =~ /^-?\d+$/
    input = calculate(input)
  end
  input
end

print "Enter expression: "
inp = gets.chomp
Checker.new.validate_input(inp)
puts calculate(inp)