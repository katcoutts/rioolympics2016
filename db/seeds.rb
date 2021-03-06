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


nation1 = Nation.new({ 'name' => 'Great Britain', 'flag' => 'http://www.flags.net/images/largeflags/UNKG0001.GIF'})
nation2 = Nation.new({ 'name' => 'Jamaica', 'flag' => 'http://www.flags.net/images/largeflags/JAMA0001.GIF'})
nation3 = Nation.new({ 'name' => 'Belgium', 'flag' => 'http://www.flags.net/images/largeflags/BELG0003.GIF'})
nation4 = Nation.new({ 'name' => 'South Africa', 'flag' => 'http://www.flags.net/images/largeflags/SOAF0001.GIF'})
nation5 = Nation.new({ 'name' => 'United States', 'flag' => 'http://www.flags.net/images/largeflags/UNST0001.GIF'})
nation6 = Nation.new({ 'name' => 'Russia', 'flag' => 'http://www.flags.net/images/largeflags/RUSS0001.GIF'})
nation7 = Nation.new({ 'name' => 'Australia', 'flag' => 'http://www.flags.net/images/largeflags/ASTL0001.GIF'})
nation8 = Nation.new({ 'name' => 'Japan', 'flag' => 'http://www.flags.net/images/largeflags/JAPA0001.GIF'})
nation9 = Nation.new({ 'name' => 'Hungary', 'flag' => 'http://www.flags.net/images/largeflags/HUNG0001.GIF'})

nation1.save
nation2.save
nation3.save
nation4.save
nation5.save
nation6.save
nation7.save
nation8.save
nation9.save


athlete1 = Athlete.new({ 'first_name' => 'Usain', 'last_name' => 'Bolt', 'nation_id' => nation2.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8F00STV1_1536x864.JPG'})
athlete2 = Athlete.new({ 'first_name' => 'Yohan', 'last_name' => 'Blake', 'nation_id' => nation2.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8D180JXX_1536x864.JPG'})
athlete3 = Athlete.new({ 'first_name' => 'James', 'last_name' => 'Dasaolu', 'nation_id' => nation1.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8D182TYF_1536x864.JPG'})
athlete4 = Athlete.new({ 'first_name' => 'Jessica', 'last_name' => 'Ennis-Hill', 'nation_id' => nation1.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8E037AT1_1536x864.JPG'})
athlete5 = Athlete.new({ 'first_name' => 'Nafi', 'last_name' => 'Thiam', 'nation_id' => nation3.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8E02HFPD_1536x864.JPG'})
athlete6 = Athlete.new({ 'first_name' => 'Katarina', 'last_name' => 'Johnson-Thompson', 'nation_id' => nation1.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8D1SFR85_1536x864.JPG'})
athlete7 = Athlete.new({ 'first_name' => 'Adam', 'last_name' => 'Peaty', 'nation_id' => nation1.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC861FMMRZ_1536x864.JPG'})
athlete8 = Athlete.new({ 'first_name' => 'Cameron', 'last_name' => 'van der Burgh', 'nation_id' => nation4.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC861GTPZY_1536x864.JPG'})
athlete9 = Athlete.new({ 'first_name' => 'Cody', 'last_name' => 'Miller', 'nation_id' => nation5.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8806UD24_1536x864.JPG'})
athlete10 = Athlete.new({ 'first_name' => 'Lilly', 'last_name' => 'King', 'nation_id' => nation5.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC89062Y0K_1536x864.JPG'})
athlete11 = Athlete.new({ 'first_name' => 'Yulia', 'last_name' => 'Efimova', 'nation_id' => nation6.id, 'image' => 'https://img.rt.com/files/2016.03/original/56ebb954c4618854408b458f.jpg'})
athlete12 = Athlete.new({ 'first_name' => 'Katie', 'last_name' => 'Melli', 'nation_id' => nation5.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8806S11W_1536x864.JPG'})
athlete13 = Athlete.new({ 'first_name' => 'Jason', 'last_name' => 'Kenny', 'nation_id' => nation1.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8E1MO4HE_1536x864.JPG'})
athlete14 = Athlete.new({ 'first_name' => 'Callum', 'last_name' => 'Skinner', 'nation_id' => nation1.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8B1PDDKY_1536x864.JPG'})
athlete15 = Athlete.new({ 'first_name' => 'Matthew', 'last_name' => 'Glaetzer', 'nation_id' => nation7.id, 'image' => 'http://www.cycling.org.au/Portals/10/EasyDNNnews/17311/Glaetzer-TT-2.jpg'})
athlete16 = Athlete.new({ 'first_name' => 'Michael', 'last_name' => 'Phelps', 'nation_id' => nation5.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8A04Z0VM_1536x864.JPG'})
athlete17 = Athlete.new({ 'first_name' => 'Masato', 'last_name' => 'Sakai', 'nation_id' => nation8.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC8719W56L_1536x864.JPG'})
athlete18 = Athlete.new({ 'first_name' => 'Tamas', 'last_name' => 'Kenderesi', 'nation_id' => nation9.id, 'image' => 'http://s.cmd.pe/8995861_c48452fd3bbbccdf5371e9ca7f27f82d_x_57a8c00f327d0.jpg'})
athlete19 = Athlete.new({ 'first_name' => 'Kevin', 'last_name' => 'Cordes', 'nation_id' => nation5.id, 'image' => 'https://ssl.gstatic.com/onebox/media/olympics/photos/o16/live/RIOEC861HOU1M_1536x864.JPG'})



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

event1 = Event.new({'name' => '100m sprint - Men', 'sport' => 'athletics'})
event2 = Event.new({'name' => 'Heptathlon - Women', 'sport' => 'athletics'})
event3 = Event.new({'name' => '100m Breaststroke - Men', 'sport' => 'swimming'})
event4 = Event.new({'name' => '100m Breaststroke - Women', 'sport' => 'swimming'})
event5 = Event.new({'name' => 'Sprint - Men', 'sport' => 'cycling'})
event6 = Event.new({'name' => '200m Butterfly - Men', 'sport' => 'swimming'})

event1.save
event2.save
event3.save
event4.save
event5.save
event6.save



participation1 = Participation.new({'athlete_id' => athlete1.id, 'event_id' => event1.id, 'position' => 1})
participation2 = Participation.new({'athlete_id' => athlete2.id, 'event_id' => event1.id, 'position' => 2})
participation3 = Participation.new({'athlete_id' => athlete3.id, 'event_id' => event1.id, 'position' => 3})
participation4 = Participation.new({'athlete_id' => athlete4.id, 'event_id' => event2.id, 'position' => 1})
participation5 = Participation.new({'athlete_id' => athlete5.id, 'event_id' => event2.id, 'position' => 2})
participation6 = Participation.new({'athlete_id' => athlete6.id, 'event_id' => event2.id, 'position' => 3})
participation7 = Participation.new({'athlete_id' => athlete7.id, 'event_id' => event3.id, 'position' => 1})
participation8 = Participation.new({'athlete_id' => athlete8.id, 'event_id' => event3.id, 'position' => 2})
participation9 = Participation.new({'athlete_id' => athlete9.id, 'event_id' => event3.id, 'position' => 3})
participation10 = Participation.new({'athlete_id' => athlete10.id, 'event_id' => event4.id, 'position' => 1})
participation11 = Participation.new({'athlete_id' => athlete11.id, 'event_id' => event4.id, 'position' => 2})
participation12 = Participation.new({'athlete_id' => athlete12.id, 'event_id' => event4.id, 'position' => 3})
participation13 = Participation.new({'athlete_id' => athlete13.id, 'event_id' => event5.id, 'position' => 1})
participation14 = Participation.new({'athlete_id' => athlete14.id, 'event_id' => event5.id, 'position' => 2})
participation15 = Participation.new({'athlete_id' => athlete15.id, 'event_id' => event5.id, 'position' => 3})
participation16 = Participation.new({'athlete_id' => athlete16.id, 'event_id' => event6.id, 'position' => 1})
participation17 = Participation.new({'athlete_id' => athlete17.id, 'event_id' => event6.id, 'position' => 2})
participation18 = Participation.new({'athlete_id' => athlete18.id, 'event_id' => event6.id, 'position' => 3})
participation19 = Participation.new({'athlete_id' => athlete19.id, 'event_id' => event3.id, 'position' => 4})



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
