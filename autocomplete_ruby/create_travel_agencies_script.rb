# frozen_string_literal: true

require 'faker'
require 'active_support/all'

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/travel_agencies.csv', 'w')

file.write('"travel_agency_id","title","city","promo_code"')
file.write("\n1,NULL,NULL,NULL")
99.times do |i|
  file.write("\n#{i + 2},'#{Faker::Company.buzzword}','#{Faker::Address.city}','#{Faker::Code.asin}'")
end

file.close