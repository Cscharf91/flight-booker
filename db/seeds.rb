# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a1 = Airport.create(code:'SFO')
a2 = Airport.create(code:'NYC')

Airport.all.each do |origin|
    Airport.all.each do |destination|
      rand(1..5).times do 
        next if origin == destination
        
        startdate = Time.now + rand(10000000)
  
        Flight.create(origin_id: origin.id,
                      destination_id: destination.id,
                      start: startdate,
                      duration: 5)
      end
    end
  end