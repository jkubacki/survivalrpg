class Reward
  attr_accessor :type, :points

  def initialize(type, points)
    @type = type
    @points = points
  end
end
