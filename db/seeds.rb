require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/event.rb')
require_relative('../models/nation.rb')
require_relative('../models/participation.rb')

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



athlete1 = Athlete.new({ 'name' => 'Usain Bolt', 'nation_id' => nation2.id})
athlete2 = Athlete.new({ 'name' => 'Yohan Blake', 'nation_id' => nation2.id})
athlete3 = Athlete.new({ 'name' => 'James Dasaolu', 'nation_id' => nation1.id})
athlete4 = Athlete.new({ 'name' => 'Jessica Ennis-Hill', 'nation_id' => nation1.id})
athlete5 = Athlete.new({ 'name' => 'Nafi Thiam', 'nation_id' => nation3.id})
athlete6 = Athlete.new({ 'name' => 'Katarina Johnson-Thompson', 'nation_id' => nation1.id})
athlete7 = Athlete.new({ 'name' => 'Adam Peaty', 'nation_id' => nation1.id})
athlete8 = Athlete.new({ 'name' => 'Cameron van der Burgh', 'nation_id' => nation4.id})
athlete9 = Athlete.new({ 'name' => 'Cody Miller', 'nation_id' => nation5.id})
athlete10 = Athlete.new({ 'name' => 'Lilly King', 'nation_id' => nation5.id})
athlete11 = Athlete.new({ 'name' => 'Yulia Efimova', 'nation_id' => nation6.id})
athlete12 = Athlete.new({ 'name' => 'Katie Melli', 'nation_id' => nation5.id})
athlete13 = Athlete.new({ 'name' => 'Jason Kenny', 'nation_id' => nation1.id})
athlete14 = Athlete.new({ 'name' => 'Callum Shearer', 'nation_id' => nation1.id})
athlete15 = Athlete.new({ 'name' => 'Matthew Glaetzer', 'nation_id' => nation7.id})
athlete16 = Athlete.new({ 'name' => 'Michael Phelps', 'nation_id' => nation5.id})
athlete17 = Athlete.new({ 'name' => 'Masato Sakai', 'nation_id' => nation8.id})
athlete18 = Athlete.new({ 'name' => 'Tamas Kenderesi', 'nation_id' => nation9.id})




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



rental1 = Rental.new({'book_id' => book1.id, 'member_id' => member1.id})
rental2 = Rental.new({'book_id' => book2.id, 'member_id' => member1.id})
rental3 = Rental.new({'book_id' => book3.id, 'member_id' => member2.id})
rental4 = Rental.new({'book_id' => book4.id, 'member_id' => member1.id})
rental5 = Rental.new({'book_id' => book5.id, 'member_id' => member2.id})
rental6 = Rental.new({'book_id' => book3.id, 'member_id' => member3.id})
rental7 = Rental.new({'book_id' => book2.id, 'member_id' => member5.id})
rental8 = Rental.new({'book_id' => book4.id, 'member_id' => member5.id})

rental1.save
rental2.save
rental3.save
rental4.save
rental5.save
rental6.save
rental7.save
rental8.save

binding.pry
nil
