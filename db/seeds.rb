# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Post.destroy_all
User.destroy_all

p "cleaning the DB"

pablo = User.create(first_name: 'Pablo', last_name: 'Barcena', username:'pablo_barcena', email: 'pablo@gmail.com', password: '123456', prof_pic:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6sGddmMZFZCqb7aJFx5eV-8FGj2gJWz7abGntj8IuyYdAv7W2HEJyi5WY3xbpLLzf-Zg&usqp=CAU')
victor = User.create(first_name: 'Victor', last_name: 'Sera', username:'victor_sera', email: 'victor@gmail.com', password: '123456', prof_pic:'https://www.pngkey.com/png/detail/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png')
mojito = User.create(first_name: 'Mojito', last_name: 'S', username:'moji_to', email: 'mojito@gmail.com', password: '123456', prof_pic: 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg')
carlotta = User.create(first_name: 'Calotta', last_name: 'Q', username:'carly_', email: 'carlotta@gmail.com', password: '123456', prof_pic:'https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_4x3.jpg')
lenny = User.create(first_name: 'Lenny', last_name: 'F', username:'len_ny', email: 'lenny@gmail.com', password: '123456', prof_pic:'https://www.shareicon.net/data/512x512/2016/08/05/806962_user_512x512.png')
pierre = User.create(first_name: 'Pierre', last_name: 'Dog', username:'pierre', email: 'pierre@gmail.com', password: '123456', prof_pic:'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d')
ana = User.create(first_name: 'Ana', last_name: 'R', username:'ana_banana', email: 'ana@gmail.com', password: '123456', prof_pic: 'https://www.kindpng.com/picc/m/163-1636340_user-avatar-icon-avatar-transparent-user-icon-png.png')

p post = Post.new(
  id: 141,
  title: 'Best song ever',
  content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  music: 'dark side of the moon',
  user: pablo
)
post.save!

p post = Post.new(
  id: 142,
  title: 'Playlist playlist playlist',
  content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  music: 'channel orange',
  user: carlotta
)
post.save!

p post = Post.new(
  id: 143,
  title: 'Good vibes only',
  content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  music: 'I hate u',
  user: ana
)
post.save!

# post_comment = PostComment.new(
#   post_id: 141,
#   user: ana,
#   content: 'amazing playlist!'
# )
# post_comment.save

# post_comment = PostComment.new(
#   post_id: 142,
#   user: mojito,
#   content: 'impeccable taste!'
# )
# post_comment.save

# post_comment = PostComment.new(
#   post_id: 142,
#   user: victor,
#   content: 'great music!'
# )
# post_comment.save

# post_comment = PostComment.new(
#   post_id: 143,
#   user: lenny,
#   content: 'This is weird'
# )
# post_comment.save

p "Finished Seeding!"
