class Attack
  attr_reader :attacker, :defender

  def initialize(attacker:, defender:)
    @attacker = FighterInAttack.new(fighter: attacker, attack: self)
    @defender = FighterInAttack.new(fighter: defender, attack: self)
  end

  def damage_dealer
    @attacker.attack_successes > @defender.attack_successes ? @attacker : @defender
  end

  def other(me)
    me.root_fighter == @attacker.root_fighter ? @defender.root_fighter : @attacker.root_fighter
  end

  def target_roll_to_attack(fighter)
    return @attacker.target_roll_to_be_attacked if @attacker.is_proxy_for?(fighter)
    return @defender.target_roll_to_be_attacked if @defender.is_proxy_for?(fighter)
    p '-' * 80
    p @attacker.fighter
    puts "\n"
    p @defender.fighter
    puts "\n"
    p fighter
    p '------'

    raise "Fighter not in attack!"
  end
end