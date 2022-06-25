# frozen_string_literal: true

require 'faker'
require 'active_support/all'

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/clients.csv', 'w')
type = ['Analyst', 'Enthusiast', 'Activist', 'Good-natured'].freeze

file.write('"client_id","personal_data_id","number_of_visits","type"')
950.times do |i|
  file.write("\n#{i + 1},#{i + 51},#{rand(1..15)},'#{type.sample}'")
end

file.close
