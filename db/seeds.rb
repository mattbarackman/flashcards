
# Seed Decks / Cards

states_capitals = Deck.create(name: "states_capitals")

CSV.foreach("States.csv", headers: true) do |row|
  states_capitals.cards << Card.create(question: "What is the capital of " + row.field('name') + "?", answer: row.field('capital'))
end

most_populous_city_by_state = Deck.create(name: "most_populous_city_by_state")

CSV.foreach("States.csv", headers: true) do |row|
  most_populous_city_by_state.cards << Card.create(question: "What is the most populous city of " + row.field('name') + "?", answer: row.field('most populous city'))
end
