# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fighter_in_action do
    initialize_with { FighterInAction.new(fighter: create(:fighter_in_round), initiative: 17) }
  end
end
