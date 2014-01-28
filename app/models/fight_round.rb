class FightRound
  def initialize(fighters:)
    @fighters = fighters.map {|fighter| FighterInRound.new(fighter: fighter)}
  end

  def turns
    @turns ||= generate_turns
    apply_modifiers_to_turns!
    @turns
  end

  protected
  def apply_modifiers_to_turns!
    @turns.each do |fighter_in_action|
      fighter_in_action.apply_modifiers!
    end
    @turns.sort_by!(&:initiative).reverse!
  end

  def generate_turns
    turns = []

    while @fighters.any? {|fighter_in_round| fighter_in_round.current_action_initiative > 0}
      next_fighter = @fighters.sort_by(&:current_action_initiative).last
      turns << FighterInAction.new(fighter: next_fighter, initiative: next_fighter.current_action_initiative)
      next_fighter.current_action_initiative -= 10
    end

    turns
  end
end