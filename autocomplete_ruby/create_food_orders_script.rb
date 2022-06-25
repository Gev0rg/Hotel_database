# frozen_string_literal: true

require 'faker'
require 'active_support/all'

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/food_orders.csv', 'w')

file.write('"food_order_id","food_id","reservation_id"')
50_000.times do |i|
  file.write("\n#{i + 1},#{rand(1..14)},#{rand(1..25_000)}")
end

file.close
