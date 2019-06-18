# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


stations = RailwayStation.where(title: ['Борисов', 'Жодино', 'Смолевичи', 'Тракторный завод', 'Минск'])
positions = {'Борисов' => 1, 'Жодино' => 2, 'Смолевичи' => 3, 'Тракторный завод' => 4, 'Минск' => 5}
positions2 = {'Борисов' => 5, 'Жодино' => 4, 'Смолевичи' => 3, 'Тракторный завод' => 2, 'Минск' => 1}
start_time = DateTime.parse('2019-05-24 10:00:00')
loop do
  train = Train.new(name: 'Борисов-Минск')
  rst_items = []
  stations.each do |station|
    start_time += 20.minutes
    rst = RailwayStationsTrain.new
    rst.train = train
    rst.railway_station = station
    rst.position = positions[station.title]
    rst.time = start_time
    rst.save
    rst_items << rst
  end
  train.railway_stations_trains = rst_items
  train.save

  route = Route.new
  route.train = train
  route.price = 1.5
  route.save

  train = Train.new(name: 'Минск-Борисов')
  rst_items = []
  stations.each do |station|
    start_time += 20.minutes
    rst = RailwayStationsTrain.new
    rst.train = train
    rst.railway_station = station
    rst.position = positions2[station.title]
    rst.time = start_time
    rst.save
    rst_items << rst
  end
  train.railway_stations_trains = rst_items
  train.save

  route = Route.new
  route.train = train
  route.price = 1.5
  route.save

  start_time += 2.hour
  break if start_time > DateTime.parse('2019-07-01')
end