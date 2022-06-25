# frozen_string_literal: true

require 'faker'
require 'active_support/all'

title = ['Work', 'Holidays', 'Holidays with the family', 'Tourism', 'Wellness'].freeze

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/goals.csv', 'w')

file.write('"goal_id","title"')
i = 1
title.each do |t|
  file.write("\n#{i},'#{t}'")
  i += 1
end

file.close