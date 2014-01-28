class FighterProxy
  def initialize(fighter:)
    @fighter = fighter
  end

  def ==(other)
    other.fighter == fighter
  rescue
    false
  end

  def method_missing(method_name, *args)
    fighter.send(method_name, *args)
  end
end