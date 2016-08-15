require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/event.rb')
require_relative('../models/nation.rb')
require_relative('../models/participation.rb')
require_relative('../models/standing.rb')

Athlete.delete_all()
Event.delete_all()
Participation.delete_all()
Nation.delete_all()


nation1 = Nation.new({ 'name' => 'Great Britain'})
nation2 = Nation.new({ 'name' => 'Jamaica'})
nation3 = Nation.new({ 'name' => 'Belgium'})
nation4 = Nation.new({ 'name' => 'South Africa'})
nation5 = Nation.new({ 'name' => 'United States'})
nation6 = Nation.new({ 'name' => 'Russia'})
nation7 = Nation.new({ 'name' => 'Australia'})
nation8 = Nation.new({ 'name' => 'Japan'})
nation9 = Nation.new({ 'name' => 'Hungary'})

nation1.save
nation2.save
nation3.save
nation4.save
nation5.save
nation6.save
nation7.save
nation8.save
nation9.save


athlete1 = Athlete.new({ 'first_name' => 'Usain', 'last_name' => 'Bolt', 'nation_id' => nation2.id})
athlete2 = Athlete.new({ 'first_name' => 'Yohan', 'last_name' => 'Blake', 'nation_id' => nation2.id})
athlete3 = Athlete.new({ 'first_name' => 'James', 'last_name' => 'Dasaolu', 'nation_id' => nation1.id})
athlete4 = Athlete.new({ 'first_name' => 'Jessica', 'last_name' => 'Ennis-Hill', 'nation_id' => nation1.id})
athlete5 = Athlete.new({ 'first_name' => 'Nafi', 'last_name' => 'Thiam', 'nation_id' => nation3.id})
athlete6 = Athlete.new({ 'first_name' => 'Katarina', 'last_name' => 'Johnson-Thompson', 'nation_id' => nation1.id})
athlete7 = Athlete.new({ 'first_name' => 'Adam', 'last_name' => 'Peaty', 'nation_id' => nation1.id})
athlete8 = Athlete.new({ 'first_name' => 'Cameron', 'last_name' => 'van der Burgh', 'nation_id' => nation4.id})
athlete9 = Athlete.new({ 'first_name' => 'Cody', 'last_name' => 'Miller', 'nation_id' => nation5.id})
athlete10 = Athlete.new({ 'first_name' => 'Lilly', 'last_name' => 'King', 'nation_id' => nation5.id})
athlete11 = Athlete.new({ 'first_name' => 'Yulia', 'last_name' => 'Efimova', 'nation_id' => nation6.id})
athlete12 = Athlete.new({ 'first_name' => 'Katie', 'last_name' => 'Melli', 'nation_id' => nation5.id})
athlete13 = Athlete.new({ 'first_name' => 'Jason', 'last_name' => 'Kenny', 'nation_id' => nation1.id})
athlete14 = Athlete.new({ 'first_name' => 'Callum', 'last_name' => 'Shearer', 'nation_id' => nation1.id})
athlete15 = Athlete.new({ 'first_name' => 'Matthew', 'last_name' => 'Glaetzer', 'nation_id' => nation7.id})
athlete16 = Athlete.new({ 'first_name' => 'Michael', 'last_name' => 'Phelps', 'nation_id' => nation5.id})
athlete17 = Athlete.new({ 'first_name' => 'Masato', 'last_name' => 'Sakai', 'nation_id' => nation8.id})
athlete18 = Athlete.new({ 'first_name' => 'Tamas', 'last_name' => 'Kenderesi', 'nation_id' => nation9.id})
athlete19 = Athlete.new({ 'first_name' => 'Kevin', 'last_name' => 'Cordes', 'nation_id' => nation5.id})



athlete1.save
athlete2.save
athlete3.save
athlete4.save
athlete5.save
athlete6.save
athlete7.save
athlete8.save
athlete9.save
athlete10.save
athlete11.save
athlete12.save
athlete13.save
athlete14.save
athlete15.save
athlete16.save
athlete17.save
athlete18.save
athlete19.save

event1 = Event.new({'name' => '100m sprint - Men', 'sport' => 'athletics', 'gold_id' => athlete1.id, 'silver_id' => athlete2.id, 'bronze_id' => athlete3.id })
event2 = Event.new({'name' => 'Heptathlon - Women', 'sport' => 'athletics', 'gold_id' => athlete4.id, 'silver_id' => athlete5.id, 'bronze_id' => athlete6.id })
event3 = Event.new({'name' => '100m Breaststroke - Men', 'sport' => 'swimming', 'gold_id' => athlete7.id, 'silver_id' => athlete8.id, 'bronze_id' => athlete9.id })
event4 = Event.new({'name' => '100m Breaststroke - Women', 'sport' => 'swimming', 'gold_id' => athlete10.id, 'silver_id' => athlete11.id, 'bronze_id' => athlete12.id })
event5 = Event.new({'name' => 'Sprint - Men', 'sport' => 'cycling', 'gold_id' => athlete13.id, 'silver_id' => athlete14.id, 'bronze_id' => athlete15.id })
event6 = Event.new({'name' => '200m Buttlerfly - Men', 'sport' => 'swimming', 'gold_id' => athlete14.id, 'silver_id' => athlete15.id, 'bronze_id' => athlete16.id })

event1.save
event2.save
event3.save
event4.save
event5.save
event6.save



participation1 = Participation.new({'athlete_id' => athlete1.id, 'event_id' => event1.id})
participation2 = Participation.new({'athlete_id' => athlete2.id, 'event_id' => event1.id})
participation3 = Participation.new({'athlete_id' => athlete3.id, 'event_id' => event1.id})
participation4 = Participation.new({'athlete_id' => athlete4.id, 'event_id' => event2.id})
participation5 = Participation.new({'athlete_id' => athlete5.id, 'event_id' => event2.id})
participation6 = Participation.new({'athlete_id' => athlete6.id, 'event_id' => event2.id})
participation7 = Participation.new({'athlete_id' => athlete7.id, 'event_id' => event3.id})
participation8 = Participation.new({'athlete_id' => athlete8.id, 'event_id' => event3.id})
participation9 = Participation.new({'athlete_id' => athlete9.id, 'event_id' => event3.id})
participation10 = Participation.new({'athlete_id' => athlete10.id, 'event_id' => event4.id})
participation11 = Participation.new({'athlete_id' => athlete11.id, 'event_id' => event4.id})
participation12 = Participation.new({'athlete_id' => athlete12.id, 'event_id' => event4.id})
participation13 = Participation.new({'athlete_id' => athlete13.id, 'event_id' => event5.id})
participation14 = Participation.new({'athlete_id' => athlete14.id, 'event_id' => event5.id})
participation15 = Participation.new({'athlete_id' => athlete15.id, 'event_id' => event5.id})
participation16 = Participation.new({'athlete_id' => athlete16.id, 'event_id' => event6.id})
participation17 = Participation.new({'athlete_id' => athlete17.id, 'event_id' => event6.id})
participation18 = Participation.new({'athlete_id' => athlete18.id, 'event_id' => event6.id})
participation19 = Participation.new({'athlete_id' => athlete19.id, 'event_id' => event3.id})



participation1.save
participation2.save
participation3.save
participation4.save
participation5.save
participation6.save
participation7.save
participation8.save
participation9.save
participation10.save
participation11.save
participation12.save
participation13.save
participation14.save
participation15.save
participation16.save
participation17.save
participation18.save
participation19.save

standing1 = Standing.new()

binding.pry
nil
