class Dice
  DEFAULT_SIDES = 6

  class << self
    def method_missing(method_name, *args)
      if (instance_methods - Object.instance_methods).include?(method_name.to_sym)
        return new.send(method_name, *args)
      end
      super(method_name, *args)
    end

    def random_number(limit)
      rand(limit) + 1
    end
  end

  def initialize
    @sides = DEFAULT_SIDES
  end

  def using_rule_of_six
    @use_rule_of_six = true
    self
  end

  def with(sides)
    @sides = sides
    self
  end

  def sides
    self
  end

  def number_of_sides
    @sides
  end

  def uses_rule_of_six?
    @use_rule_of_six
  end

  def roll
    roll = self.class.random_number(number_of_sides)
    another_roll?(roll) ? roll + dup.roll : roll
  end

  protected
  def another_roll?(roll)
    # rule of six
    roll == 6 && number_of_sides == 6 && uses_rule_of_six?
  end
end