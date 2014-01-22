class FighterInRound
  attr_reader :fighter, :combat_pool

  def initialize(fighter)
    @fighter = fighter

    @combat_pool = fighter.combat_pool
  end

  def use_combat_pool(how_much)
    raise Error::PoolEmptyError if how_much > combat_pool
    @combat_pool -= how_much
  end
end