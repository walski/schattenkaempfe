# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fighter_in_attack do
    fighter {create(:fighter_in_round)}
  end
end
