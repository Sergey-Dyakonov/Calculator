class NumericExpressionError < StandardError
  def initialize(msg = "Only digits and special signs are allowed")
    super(msg)
  end
end