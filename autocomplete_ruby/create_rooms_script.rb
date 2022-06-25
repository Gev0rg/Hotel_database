# frozen_string_literal: true

require 'faker'
require 'active_support/all'

room_class = ['Economy', 'Comfort', 'Luxury', 'Presidential'].freeze

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/rooms.csv', 'w')

file.write('"room_id","hotel_id","building","room_num","class","num_of_beds","kitchen","tv","price"')
5.times do |j|
  k = 100 * j
  100.times do |i|
    rc = room_class.sample
    rp = [6000, 5500].sample if rc == room_class[3]
    rp = [5000, 4500].sample if rc == room_class[2]
    rp = [4000, 3500].sample if rc == room_class[1]
    rp = [3000, 2500].sample if rc == room_class[0]
    file.write("\n#{k + i + 1},#{j + 1},#{[1, 2, 3].sample},#{i + 1},'#{rc}',#{[1, 2, 3].sample},'#{['Y', 'N'].sample}','#{['Y', 'N'].sample}',#{rp}")
  end
end

file.close
