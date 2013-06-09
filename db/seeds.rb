
# Seed Decks / Cards

states_capitals = Deck.create(name: "states_capitals")

CSV.foreach("States.csv", headers: true) do |row|
  states_capitals.cards << Card.create(question: "What is the capital of " + row.field('name') + "?", answer: row.field('capital'))
end
