# frozen_string_literal: true

require 'faker'
require 'active_support/all'

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/hotels.csv', 'w')

file.write('"hotel_id","city"')
5.times do |i|
  file.write("\n#{i + 1},'#{Faker::Address.city}'")
end

file.close