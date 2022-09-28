class FormatError < StandardError
  def initialize(msg = "Expression doesn't match required format")
    super(msg)
  end
end
