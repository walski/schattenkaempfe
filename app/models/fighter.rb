class Fighter < ActiveRecord::Base
  def reaction
    (intelligence + quickness) / 2
  end

  def initiative_roll
    2.times.sum {Dice.with(6).sides.roll} + reaction
  end

  def combat_pool
    (quickness + intelligence + willpower) / 2
  end
end