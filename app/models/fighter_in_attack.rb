class FighterInAttack < FighterProxy
  attr_reader :attack

  def initialize(fighter:, attack:)
    super(fighter: fighter)
    @attack = attack
  end

  def combat_skill
    4
  end

  def target_roll_to_be_attacked
    4
  end

  def combat_pool_to_use
    0
  end

  def attack_successes
    attack_roll.select {|roll| roll >= attack.target_roll_to_attack(attack.other(self))}.length
  end

  def disastrous_mistake?
    attack_roll.all? {|r| r == 1}
  end

  def attack_roll
    @attack_roll ||= combat_skill.times.map {Dice.with(6).sides.using_rule_of_six.roll}
  end
end