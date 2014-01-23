class FighterInRound
  attr_reader :fighter, :combat_pool
  attr_accessor :current_action_initiative

  def initialize(fighter)
    @fighter = fighter

    @combat_pool = fighter.combat_pool
    @current_action_initiative = initiative_roll
  end

  def initiative_roll
    @initiative_roll ||= fighter.initiative_roll
  end

  def use_combat_pool(how_much)
    raise Error::PoolEmptyError if how_much > combat_pool
    @combat_pool -= how_much
  end

  def ==(other)
    other.fighter == fighter && other.initiative_roll == initiative_roll && other.combat_pool == combat_pool
  rescue
    false
  end

  def method_missing(method_name, *args)
    fighter.send(method_name, *args)
  end
end