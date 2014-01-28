class FighterInAction < FighterProxy
  attr_reader :initiative, :fighter

  def initialize(fighter:, initiative:)
    super(fighter: fighter)
    @initiative = initiative
  end

  def ==(other)
    super(other) && other.initiative == initiative
  rescue
    false
  end

  def apply_modifiers!
  end
end