
# Seed Decks / Cards

states_capitals = Deck.create(name: "US: state capitals")

CSV.foreach("States.csv", headers: true) do |row|
  states_capitals.cards << Card.create(question: "What is the capital of " + row.field('name') + "?", answer: row.field('capital'))
end

most_populous_city_by_state = Deck.create(name: "US: most populous city per state")

CSV.foreach("States.csv", headers: true) do |row|
  most_populous_city_by_state.cards << Card.create(question: "What is the most populous city in " + row.field('name') + "?", answer: row.field('most populous city'))
end
