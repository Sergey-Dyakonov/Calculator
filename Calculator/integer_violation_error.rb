class IntegerViolationError < StandardError
  def initialize(msg = "Only integers are allowed")
    super(msg)
  end
end
