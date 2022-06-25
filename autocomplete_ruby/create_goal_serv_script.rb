# frozen_string_literal: true

require 'faker'
require 'active_support/all'

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/goal_serv.csv', 'w')

file.write('"goal_serv_id","service_id","goal_id"')
file.write("\n1,9,1")
file.write("\n2,3,1")
file.write("\n3,2,2")
file.write("\n4,3,2")
file.write("\n5,4,2")
file.write("\n6,5,2")
file.write("\n7,1,3")
file.write("\n8,2,3")
file.write("\n9,11,3")
file.write("\n10,6,4")
file.write("\n11,3,5")
file.write("\n12,4,5")
file.write("\n13,5,5")
file.write("\n14,7,5")
file.write("\n15,8,5")

file.close
