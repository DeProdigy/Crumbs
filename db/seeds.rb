# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all

user1 = User.create(username: 'Alex')
user2 = User.create(username: 'Daniel')

Post.create(user_id: user1.id, image_url: 'http://sweetgreen.com/content/uploads/2013/04/img-home-slide-d.jpg', latitude: '40.7157648', longitude: '-73.959351')
Post.create(user_id: user1.id, image_url: 'http://newyork.seriouseats.com/images/20100112-dostoros-quesadilla-innards.jpg', latitude: '40.7176045', longitude: '-73.9580386')
Post.create(user_id: user1.id, image_url: 'http://maaclink.org/wp-content/uploads/2014/03/home.jpg', latitude: '40.6008149', longitude: '-73.9873753')
Post.create(user_id: user1.id, image_url: 'http://weknowyourdreams.com/image.php?pic=/images/tea/tea-07.jpg', latitude: '40.5877486', longitude: '-73.9556395')


Post.create(user_id: user2.id, image_url: 'http://1.bp.blogspot.com/-AGdMdfvtPbQ/Vae-YAhtnVI/AAAAAAAAFRg/OPKwgGBVzTA/s1600/coffee-and-breakfast1.png', latitude: '40.7136643', longitude: '-73.9658318')
Post.create(user_id: user2.id, image_url: 'http://i.huffpost.com/gen/353321/MTA-MAP.jpg', latitude: '40.7178064', longitude: '-73.9576661')
Post.create(user_id: user2.id, image_url: 'http://www.cpsc.gov/PageFiles/78256/08314a.jpg', latitude: '40.6040581', longitude: '-73.9584267')
Post.create(user_id: user2.id, image_url: 'http://www.businessgreen.com/IMG/846/219846/coffee-cup.jpg', latitude: '40.6418153', longitude: '-73.9633948')
