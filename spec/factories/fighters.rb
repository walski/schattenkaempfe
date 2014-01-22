# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:d6) {|n| rand(6) + 1}

  factory :fighter do
    body {generate(:d6)}
    quickness {generate(:d6)}
    strength {generate(:d6)}
    charisma {generate(:d6)}
    intelligence {generate(:d6)}
    willpower {generate(:d6)}
    essence {generate(:d6)}
    magic {generate(:d6)}

    sequence(:initiative) {|n| rand(2) + 1}

    sequence(:name) {|n| "Fighter #{n}"}

    factory :good_fighter do
      body 5
      quickness 5
      strength 5
      charisma 5
      intelligence 5
      willpower 5
      essence 6
      magic 0

      initiative 2
    end
  end
end
