# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

Meetup.destroy_all
User.destroy_all

meetup = Meetup.create(name: "Kickball", description: "Kick a ball with friends!", location: "Philadelphia", creator: "Kelly")
meetup1 = Meetup.create(name: "Baseball", description: "Bat a ball with friends", location: "Philadelphia", creator: "John")
meetup2 = Meetup.create(name: "Unicorn riding", description: "Ride a unicorn!", location: "Bala Cynwyd", creator: "Arielle")
meetup3 = Meetup.create(name: "Storytime", description: "Get your kids to read", location: "Bala Cynwyd", creator: "Joel")
meetup4 = Meetup.create(name: "Fingerpainting", description: "Paint with your fingers", location: "Bala Cynwyd", creator: "Mickey")

user = User.create(provider: "Harry Potter", uid: "234567", username: "Harry_Freakin_Potter", email: "Hedwig01@gmail.com", avatar_url: "http://vignette1.wikia.nocookie.net/harrypotter/images/c/cd/Harry-potter-and-the-sorcerers-stone1.jpg/revision/latest/scale-to-width-down/149?cb=20150725151406")
user1 = User.create(provider: "Ron Weasley", uid: "234568", username: "Redhead_5", email: "RonW@gmail.com", avatar_url: "https://typeset-beta.imgix.net/rehost%2F2016%2F9%2F13%2F556a0b44-17b5-429c-8954-2dc926bfbc70.jpg")
user2 = User.create(provider: "Hermione Granger", uid: "234569", username: "Smarty_Pants_granger", email: "Granger@gmail.com", avatar_url: "https://img.buzzfeed.com/buzzfeed-static/static/2015-03/22/15/campaign_images/webdr15/how-well-do-you-know-hermione-granger-2-3038-1427052786-12_dblbig.jpg")
user3 = User.create(provider: "Hagrid", uid: "234560", username: "Beardo", email: "Hagrid@gmail.com", avatar_url: "http://static.comicvine.com/uploads/original/11114/111142328/3907799-sym_hagrid.jpg")
user4 = User.create(provider: "Albus Dumbledore", uid: "234561", username: "Professor_Dee", email: "Dumbledore@gmail.com", avatar_url: "https://s-media-cache-ak0.pinimg.com/originals/eb/b6/c4/ebb6c46557cfd85a9553970b637d7146.jpg")

Attendance.create(user: user, meetup: meetup)
Attendance.create(user: user1, meetup: meetup1)
Attendance.create(user: user2, meetup: meetup1)
Attendance.create(user: user3, meetup: meetup4)
Attendance.create(user: user4, meetup: meetup3)
Attendance.create(user: user3, meetup: meetup2)
