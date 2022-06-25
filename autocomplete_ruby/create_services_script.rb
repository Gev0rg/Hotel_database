# frozen_string_literal: true

require 'faker'
require 'active_support/all'

title_price = [['Children\'s entertainment', 1500], ['Aquapark', 1000], ['Massage', 2000],
         ['Spa', 3000], ['Fitness', 800], ['Excursion', 600], ['Tennis', 500], ['Football', 500],
         ['Coworking', 1000], ['Food in the room', 150], ['Baby\'s bed', 1000]].freeze

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/services.csv', 'w')

file.write('"service_id","title","price"')
i = 1
title_price.each do |tp|
  file.write("\n#{i},'#{tp[0]}', #{tp[1]}")
  i += 1
end

file.close