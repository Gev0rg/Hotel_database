# frozen_string_literal: true

require 'faker'
require 'active_support/all'

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/reservation.csv', 'w')

file.write('"reservation_id","room_id","employee_id","goal_id","travel_agency_id","client_id","arrival_date","departure_date"')
15_000.times do |j|
  arrival_date = Faker::Date.between(from: '2015-01-23', to: '2018-09-25').to_s
  departure_date = arrival_date
  month = (arrival_date[-5] + arrival_date[-4]).to_i + 1
  departure_date = if month.div(10) == 0 && departure_date[8..9].to_i > 28
                     "#{departure_date[0..5]}#{month}-#{departure_date[8..9].to_i - 3}"
                   elsif month.div(10) == 0
                     "#{departure_date[0..5]}#{month}#{departure_date[7..9]}"
                   elsif month == 13 && departure_date[8..9].to_i > 28
                     "#{departure_date[0..2]}#{departure_date[3].to_i + 1}-01-#{departure_date[8..9].to_i - 3}"
                   elsif month == 13
                     "#{departure_date[0..2]}#{departure_date[3].to_i + 1}-01-#{departure_date[8..9]}"
                   elsif departure_date[8..9].to_i > 28
                     "#{departure_date[0..4]}#{month}-#{departure_date[8..9].to_i - 3}"
                   else
                     "#{departure_date[0..4]}#{month}-#{departure_date[8..9]}"
                   end
  file.write("\n#{j + 1},#{rand(1..500)},#{rand(1..16)},#{rand(1..5)},1,#{rand(1..950)},\"#{arrival_date}\",\"#{Faker::Date.between(
    from: arrival_date, to: departure_date
  )}\"")
end
10_000.times do |j|
  arrival_date = Faker::Date.between(from: '2015-01-23', to: '2018-09-25').to_s
  departure_date = arrival_date
  month = (arrival_date[-5] + arrival_date[-4]).to_i + 1
  departure_date = if month.div(10) == 0 && departure_date[8..9].to_i > 28
                     "#{departure_date[0..5]}#{month}-#{departure_date[8..9].to_i - 3}"
                   elsif month.div(10) == 0
                     "#{departure_date[0..5]}#{month}#{departure_date[7..9]}"
                   elsif month == 13 && departure_date[8..9].to_i > 28
                     "#{departure_date[0..2]}#{departure_date[3].to_i + 1}-01-#{departure_date[8..9].to_i - 3}"
                   elsif month == 13
                     "#{departure_date[0..2]}#{departure_date[3].to_i + 1}-01-#{departure_date[8..9]}"
                   elsif departure_date[8..9].to_i > 28
                     "#{departure_date[0..4]}#{month}-#{departure_date[8..9].to_i - 3}"
                   else
                     "#{departure_date[0..4]}#{month}-#{departure_date[8..9]}"
                   end
  file.write("\n#{j + 15_001},#{rand(1..500)},#{rand(1..16)},#{rand(1..5)},#{rand(2..100)},#{rand(1..950)},\"#{arrival_date}\",\"#{Faker::Date.between(
    from: arrival_date, to: departure_date
  )}\"")
end

file.close
