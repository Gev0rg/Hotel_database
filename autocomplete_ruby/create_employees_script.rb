# frozen_string_literal: true

require 'faker'
require 'active_support/all'

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/employees.csv', 'w')

file.write('"employee_id","personal_data_id","hotel_id","education","position","salary"')
5.times do |i|
  k = i * 3
  file.write("\n#{k + 1},#{k + 1},#{i + 1},'higher education','senior administrator',150000")
  file.write("\n#{k + 2},#{k + 2},#{i + 1},'higher education','junior administrator',90000")
  file.write("\n#{k + 3},#{k + 3},#{i + 1},'higher education','junior administrator',90000")
end
5.times do |i|
  k = i * 7 + 7
  file.write("\n#{k + 9},#{k + 9},#{i + 1},'secondary education','cleaner',40000")
  file.write("\n#{k + 10},#{k + 10},#{i + 1},'secondary education','cleaner',40000")
  file.write("\n#{k + 11},#{k + 11},#{i + 1},'higher education','chef',100000")
  file.write("\n#{k + 12},#{k + 12},#{i + 1},'higher education','cook',80000")
  file.write("\n#{k + 13},#{k + 13},#{i + 1},'higher education','cook',80000")
  file.write("\n#{k + 14},#{k + 14},#{i + 1},'secondary education','security',60000")
  file.write("\n#{k + 15},#{k + 15},#{i + 1},'secondary education','security',60000")
end

file.close
