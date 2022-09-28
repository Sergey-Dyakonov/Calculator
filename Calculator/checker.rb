class Checker

  public def validate_input(inp)
    check_format(inp)
    check_int(inp)
    check_zero_division(inp)
    check_chars(inp)
  end

  private def check_int(inp)
    values = inp.split(@operators_pattern)
    values.each { |val|
      if val =~ /\d+[.,]\d+/
        raise IntegerViolationError
      end
    }
  end

  private def check_chars(inp)
    inp.chars.each { |c|
      unless c =~ /[+\-\/*()]|[0-9]/
        raise NumericExpressionError
      end
    }
  end

  private def check_zero_division(inp)
    if inp.include? "/0"
      raise ZeroDivisionError
    end
  end

  private def check_format(inp)
    if inp.include?("(") && !inp.include?(")") ||
      inp.include?(")") && !inp.include?("(")
      raise FormatError
    end
    open = 0
    close = 0
    inp.chars.each { |c|
      if c == "("
        open += 1
      end
      if c == ")"
        close += 1
      end
    }
    if open != close
      raise FormatError
    end
  end
end
