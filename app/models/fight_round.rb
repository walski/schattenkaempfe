class FightRound
  def initialize(fighters:)
    @fighters = fighters.map {|fighter| FighterInRound.new(fighter)}
  end

  def actions
    @actions ||= generate_actions
  end

  protected
  def generate_actions
    actions = []

    while @fighters.any? {|fighter_in_round| fighter_in_round.current_action_initiative > 0}
      next_fighter = @fighters.sort_by(&:current_action_initiative).last
      actions << FighterInAction.new(fighter_in_round: next_fighter, initiative: next_fighter.current_action_initiative)
      next_fighter.current_action_initiative -= 10
    end

    actions
  end
end