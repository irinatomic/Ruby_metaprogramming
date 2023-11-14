# require "google_drive"
# session = GoogleDrive::Session.from_config("config.json")
# ws = session.spreadsheet_by_key("1NW-Kxv08WYDQWrKx3nJE8zNnMP82zbmSYrFto7CR4G8").worksheets[0]

require './table'

table1 = Table.new("data/table1.xlsx")
table2 = Table.new("data/table2.xlsx")
table3 = Table.new("data/table3.xlsx")

# ispis tabele
p table1.to_s
puts '------------------'

# ispis headera tabele -> prvi red
p table1.row(1)
puts '------------------'

# pristup kolonama tabele
p table1["treca_kolona"]
puts '------------------'

# pristup tacnom redu u koloni tabele
p table1["treca_kolona"][2]
puts '------------------'

# podesavamo vrednost tacnom bolju u koloni tabele
table1["treca_kolona"][2]= 100
p table1["treca_kolona"][2]
puts '------------------'

# pristup koloni preko istoimene metode
p table1.prva_kolona.to_s
puts '------------------'

# sum i avg kolone
puts "suma #{table1.prva_kolona.sum}"
puts "avg  #{table1.prva_kolona.avg}"
puts '------------------'

# vracamo redove tabele koje imaju neko polje u koloni
p table3.treca_kolona.rn
puts '------------------'

# map, select, reduce -> &. safety operator for nil
table1.prva_kolona.map! { |cell| cell+(1) } 
puts "map       #{table1.prva_kolona.to_s}"

niz = table1.prva_kolona.select! { |cell| cell > 1 } 
puts "select    #{niz}"

initial_value = 0.0  
reduction_block = lambda { |accumulator, value| accumulator + value }
result = table1.prva_kolona.reduce(initial_value, &reduction_block)
puts "reduce    #{result}"
puts '------------------'
