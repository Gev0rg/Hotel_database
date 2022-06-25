# frozen_string_literal: true

require 'faker'
require 'active_support/all'

file = File.open('/home/gevork/kursach_01/autocomplete_ruby/personal_data.csv', 'w')
data_type = ['Passport', 'Driver license', 'Certificate of replacement passport']

file.write('"personal_data_id","document_type","document_num","date_of_birth","name","surname","patronymic"')
1000.times do |i|
  file.write("\n#{i + 1},'#{data_type.sample}',#{rand(1_000_000_00..9_999_999_99)},\"#{Faker::Date.between(from: '1980-01-01', to: '2004-12-31')}\",'#{Faker::Name.first_name}','#{Faker::Name.last_name}','#{Faker::Name.male_first_name}'")
end

file.close
