class FighterInAction
  attr_reader :initiative, :fighter_in_round

  def initialize(fighter_in_round:, initiative:)
    @fighter_in_round = fighter_in_round
    @initiative = initiative
  end

  def ==(other)
    other.initiative == initiative && other.fighter_in_round == fighter_in_round
  rescue
    false
  end

  def method_missing(method_name, *args)
    fighter_in_round.send(method_name, *args)
  end
end