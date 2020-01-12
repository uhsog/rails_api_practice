# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Author.find_or_create_by!(name = '') do |author|
#   author.name = 'Shuhei Goto'
#   author.birth = Date.new(1993, 6, 1)
#   author.from = 'Japan, Kumamoto'
# end

# Author.create!(name: 'Shuhei Goto', birth: Date.new(1993, 6, 1), from: 'Japan, Kumamoto')

require 'faker'

(1..10).map do
  Author.create!(
    name: Faker::Name.name,
    birth: Faker::Date.birthday(min_age: 30, max_age: 65),
    from: %w[Japan USA Germany Canada UK'].sample)
end
