# frozen_string_literal: true

require 'faker'
require 'active_support/all'

type_price = [['NO', 0], ['Bed & breakfast', 500], ['Half board', 1000],
              ['Full board', 1500], ['All inclusive', 2000], ['Child bed & breakfast', 300],
              ['Child Half board', 600], ['Child Full board', 1200],
              ['Vegetarian bed & breakfast', 600], ['Vegetarian Half board', 1200],
              ['Vegetarian Full board', 1800], ['Certain bed & breakfast', 200],
              ['Certain Half board', 400], ['Certain Full board', 600]].freeze

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/food.csv', 'w')

file.write('"food_id","type","price"')
i = 1
type_price.each do |tp|
  file.write("\n#{i},'#{tp[0]}',#{tp[1]}")
  i += 1
end

file.close