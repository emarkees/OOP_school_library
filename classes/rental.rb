class rental
  attr_accessor date

  def initialize(date)
    @date = date.now
  end
end