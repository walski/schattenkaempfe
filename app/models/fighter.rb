class Fighter < ActiveRecord::Base
  def reaction
    (intelligence + quickness) / 2
  end

  def initiative_roll
    2.times.sum {Dice.with(6).sides.roll} + reaction
  end
end