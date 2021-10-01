# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
%w( AUDCHF AUDCAD AUDJPY AUDNZD AUDUSD CADCHF CADJPY CHFJPY EURAUD EURCAD EURCHF EURGBP EURJPY EURNZD EURUSD GBPAUD GBPCHF GBPCAD GBPJPY GBPNZD GBPUSD NZDCAD NZDCHF NZDUPY NZDUSD USDCHF USDCAD USDJPY XAUUSD XAGUSD ).each do |symbol|

  Instrument.create(symbol: symbol)
end
