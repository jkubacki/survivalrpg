class DrawReward

  def initialize(risk)
    @risk = risk.to_i
  end

  def call
    rewards = []
    reward_count.times do
      rewards << draw_reward
    end
    rewards
  end

  private

  def reward_count
    rand(0..@risk)
  end

  def draw_reward
    Reward.new(draw_type, draw_points)
  end

  def draw_type
    %w(food food food food food water water water water water medicaments weapons vehicle building).sample
  end

  def draw_points
    rand(1..3)
  end
end
