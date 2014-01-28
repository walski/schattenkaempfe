class FighterProxy
  attr_reader :fighter

  def initialize(fighter:)
    @fighter = fighter
  end

  def ==(other)
    other.fighter == fighter
  rescue
    false
  end

  def is_proxy_for?(fighter_in_question)
    root_fighter == (fighter_in_question.try(:root_fighter) || fighter_in_question)
  end

  def root_fighter
    fighter.try(:root_fighter) || fighter
  end

  def method_missing(method_name, *args)
    fighter.send(method_name, *args)
  end
end