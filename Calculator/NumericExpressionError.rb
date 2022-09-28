class NumericExpressionError < StandardError
  def initialize(msg = "Only digits and special signs are allowed", str)
    super(msg)
  end
end