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

pablo = User.create(id: 100, first_name: 'Pablo', last_name: 'Barcena', username: 'pablo_barcena', email: 'pablo@gmail.com', password: '123456', prof_pic: 'https://avatars.githubusercontent.com/u/95871127?v=4')
victor = User.create(id: 101, first_name: 'Victor', last_name: 'Sera', username: 'victor_sera', email: 'victor@gmail.com', password: '123456', prof_pic: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641543962/edf4n4j98l66qhxysty2.jpg')
mojito = User.create(id: 102, first_name: 'Mojito', last_name: 'Hohenlohe', username: 'moji_to', email: 'mojito@gmail.com', password: '123456', prof_pic: 'https://www.petdarling.com/wp-content/uploads/2014/08/perros-jack-russell-terrier.jpg')
carlotta = User.create(id: 103, first_name: 'Calotta', last_name: 'Ivaylova', username: 'carly_', email: 'carlotta@gmail.com', password: '123456', prof_pic: 'https://i.pinimg.com/474x/1f/f0/07/1ff0079829f25060d761652bb3acfd39--terrier-puppies-terrier-mix.jpg')
lenny = User.create(id: 104, first_name: 'Lenny', last_name: 'von Velsen', username: 'len_ny', email: 'lenny@gmail.com', password: '123456', prof_pic: 'https://avatars.githubusercontent.com/u/80490570?v=4')
pierre = User.create(id: 105, first_name: 'Pierre', last_name: 'Dog', username: 'pie_rre', email: 'pierre@gmail.com', password: '123456', prof_pic: 'https://animals.net/wp-content/uploads/2018/07/Dachshund-1.jpg')
ana = User.create(id: 106, first_name: 'Ana', last_name: 'Reblo', username: 'ana_banana', email: 'ana@gmail.com', password: '123456', prof_pic: 'https://avatars.githubusercontent.com/u/86108098?v=4')
sol = User.create(id: 107, first_name: 'Sol', last_name: 'Büker', username: 'sol_b', email: 'sol@gmail.com', password: '123456', prof_pic: 'https://avatars.githubusercontent.com/u/93938447?v=4')
nicky = User.create(id: 108, first_name: 'Nicky', last_name: 'Czemerinski', username: 'nick_yy', email: 'nicky@gmail.com', password: '123456', prof_pic: 'https://avatars.githubusercontent.com/u/96747887?v=4')
fanny = User.create(id: 109, first_name: 'Fanny', last_name: 'Hohenlohe', username: 'fanny_h', email: 'fanny@gmail.com', password: '123456', prof_pic: 'https://avatars.githubusercontent.com/u/96741285?v=4')
pablo_w = User.create(id: 110, first_name: 'Pablo', last_name: 'Wilner', username: 'pablo_w', email: 'pab@gmail.com', password: '123456', prof_pic: 'https://avatars.githubusercontent.com/u/31549173?v=4')
barbie = User.create(id: 111, first_name: 'Barbi', last_name: 'Gray', username: 'barb_ie', email: 'barb@gmail.com', password: '123456', prof_pic: 'https://avatars.githubusercontent.com/u/96505852?v=4')
emi = User.create(id: 112, first_name: 'Emi', last_name: 'Ivaylova', username: 'emi_l', email: 'emi@gmail.com', password: '123456', prof_pic: 'https://ca.slack-edge.com/T02NE0241-U01PG6641K8-6e00d220cfc8-192')
gonzo = User.create(id: 113, first_name: 'Gonzo', last_name: 'Guerra', username: 'gonzo', email: 'gonzo@gmail.com', password: '123456', prof_pic: 'https://ca.slack-edge.com/T02NE0241-U02G0T60ZD5-9932fe199648-192')
niko = User.create(id: 114, first_name: 'Niko', last_name: 'Agathos', username: 'niko_freako', email: 'niko@gmail.com', password: '123456', prof_pic: 'https://ca.slack-edge.com/T02NE0241-UHQ57PH17-db1a7d442627-192')
isa = User.create(id: 115, first_name: 'Isa ', last_name: 'Lopez', username: 'isa_l', email: 'isa@gmail.com', password: '123456', prof_pic: 'https://ca.slack-edge.com/T02NE0241-USMH8GJ23-520cab62efed-512')
fanny_fr = User.create(id: 116, first_name: 'Fanny', last_name: 'Rojon', username: 'fanny_r', email: 'fannyr@gmail.com', password: '123456', prof_pic: 'https://ca.slack-edge.com/T02NE0241-UNVPHNFB7-8ba17acd5296-512')
valerie = User.create(id: 117, first_name: 'Valerie', last_name: 'Chang', username: 'val_c', email: 'valerie@gmail.com', password: '123456', prof_pic: 'https://avatars.githubusercontent.com/u/63011622?v=4')

p post = Post.new(
  id: 156,
  title: 'Happy Final Project Day!',
  content: 'Don\'t stop beliving in yourself!! Check your slack and you\'ll see there\'s beer in the fridge and icecream in the freezer. Good luck on your final project pitches you\'ve all come so far and worked so hard. Can\'t wait to see how far you all go 💫',
  music: 'Don\'t Stop Belivin\'',
  artist: 'Journey',
  user: fanny_fr,
  image: "https://m.media-amazon.com/images/I/71lKLUA3w6L._SL1200_.jpg",
  url: 'https://open.spotify.com/track/4bHsxqR3GMrXTxEPLuK5ue?si=95dfe93913a24eff'
)
post.save!

p post = Post.new(
  id: 157,
  title: 'Did you forget it\'s Friday?',
  content: 'Happy friday!! party party party everyday until we die. 🥳',
  music: 'Friday',
  artist: 'Riton',
  user: valerie,
  image: "https://i.scdn.co/image/ab67616d0000b273815cb538fd7821595b2bc8c5",
  url: 'https://open.spotify.com/album/39qsmsNRXjVaFqTZj9af0j?si=0bjWWSfuQCCnOxTEKwpjgw'
)
post.save!

p post = Post.new(
  id: 158,
  title: 'Mi cancion favorito',
  content: 'This is my favorite song ever! The producer is American so there\'s some country influence but it maintains it\'s Spanish rock roots. It\'s so beautiful. The singer is so like uuuuuuf. Do you like it??? ',
  music: 'El Sol No Regresa',
  artist: 'La Quinta Estacion',
  user: pablo,
  image: "https://i.scdn.co/image/ab67616d0000b273e4d5513aceb8f43f91b9c321",
  url: 'https://open.spotify.com/track/0c8f8b76ThPP2MInXEZyTY?si=c61814a11c3a4c26'
)
post.save!

p post = Post.new(
  id: 148,
  title: 'Happy International Women\'s Day!',
  content: 'It\'s so amazing we have a day to celebrate women internationally 👸🏽! Just wanted to remind everyone to check slack because I have some cute stickers to hand out and I\'d love everyone to get in this reel for the Lewagon instagram. Also there\'s a march today so please dm if you want to join!',
  music: 'Girls Just Wanna Have Fun',
  artist: 'Cindi Lauper',
  user: emi,
  image: "https://upload.wikimedia.org/wikipedia/en/0/09/ShesSoUnusual1984.PNG",
  url: 'https://open.spotify.com/track/4y1LsJpmMti1PfRQV9AWWe?si=c03fc25a2c574ada'
)
post.save!

p post = Post.new(
  id: 149,
  title: 'Bulgarian Folkmusic Techno-ized',
  content: 'Do you like Bulgarian folk music? Do you like techno? Do you like old men 👴🏻? Do you like being unmarried? Why not enjoy all in one song!',
  music: 'Unmarried Old Man',
  artist: 'Introversion',
  user: niko,
  image: "https://f4.bcbits.com/img/a1621475993_5.jpg",
  url: 'https://open.spotify.com/track/33835V1ZeiU8bXc4CjT0Lv?si=83cb36dc90c0409a'
)
post.save!

p post = Post.new(
  id: 151,
  title: 'I\'m obsessed with this new BTS song!',
  content: 'This new song is great but it\'s kinda weird that Coldplay is in it too. I think they\'re just trying to stay relevant. Anyhoo I love K-Pop, who wants to go to Korea with me???? Please follow my fan account @carlotta_loves_bts on insta!!',
  music: 'My Universe',
  artist: 'Introversion',
  user: carlotta,
  image: "https://s3.amazonaws.com/images.imvdb.com/video/114043250033-coldplay-my-universe_music_video_ov.jpg?v=2",
  url: 'https://open.spotify.com/track/46HNZY1i7O6jwTA7Slo2PI?si=2f9ba22daa4e43e7'
)
post.save!

p post = Post.new(
  id: 152,
  title: 'This song is soooo sick',
  content: 'Bad Bunny can do no wrong. Everything he drops is straight fireeeeeee ! TBH tho all of his songs sound the same.',
  music: 'Lo Siento BB:/',
  artist: 'Bad Bunny',
  user: pierre,
  image: "https://i.ytimg.com/vi/sfQOiDJX-x4/maxresdefault.jpg",
  url: 'https://open.spotify.com/track/4gzsuuZypVbxs0Af1LSZyB?si=aec0afac40014aa2'
)
post.save!

p post = Post.new(
  id: 153,
  title: 'Get Hyped for the Reggatone Party',
  content: 'Can\'t wait for the weekend party at Valerie\'s! Going to to the Argentinian party after and everyone\'s invited!! Bring Fernet. Che Boludo!!!',
  music: 'AM Remix',
  artist: 'Nio Garcia, J Balvin, Bad Bunny',
  user: pablo_w,
  image: "https://images.genius.com/fdb8446b833eed07aec4822c1ce462f4.1000x1000x1.png",
  url: 'https://open.spotify.com/track/05bfbizlM5AX6Mf1RRyMho?si=12d6ecd9909e4da6'
)
post.save!

p post = Post.new(
  id: 154,
  title: 'I have Impeccable Music Taste',
  content: 'Most underrated song ever made. Everyone should listen to it. Also check your slack',
  music: 'Amy Says',
  artist: 'Fly Leaf',
  user: gonzo,
  image: "https://lastfm.freetls.fastly.net/i/u/770x0/de804b14ee214e32bb7bfa844bc4200c.jpg",
  url: 'https://open.spotify.com/track/2CcpyG2gyFmmlaIE0sO27o?si=c45ab4a08d984e8c'
)
post.save!

p post = Post.new(
  id: 155,
  title: 'New Rosalia Album is amazing!!',
  content: 'Rosalia is a music genius and she\'s a cultural icon. This album is perfect and so hype',
  music: 'CHICKEN TERIYAKI',
  artist: 'ROSÁLIA',
  user: sol,
  image: "https://i.scdn.co/image/ab67616d0000b27379c5d15767f548876e2c7d1d",
  url: 'https://open.spotify.com/track/3jHYDEB0YUNJCSEMF2um60?si=4851b03a30664b7a'
)
post.save!

p post = Post.new(
  id: 150,
  title: 'Looooove Queen :)',
  content: 'I\'m the best DJ ever 🎧! I love oldies and this song is great. Pre-party at my house tonight!!!',
  music: 'Don\'t Stop Me Now',
  artist: 'Queen',
  user: barbie,
  image: "https://upload.wikimedia.org/wikipedia/en/9/97/Queen-dont-stop-me-now-1979-6-s.jpg",
  url: 'https://open.spotify.com/track/43DHLzDkncpby82Po5jlOZ?si=80e613481c8b4890'
)
post.save!


p post = Post.new(
  id: 141,
  title: 'Greatest Album ever Created!',
  content: 'Isolation, paranoia and mental breakdown are the unrelenting themes 🌙 of the last three tracks, Any Colour You Like, Brain Damage and Eclipse. Roger would pursue these themes with a vengeance on later Pink Floyd albums, driven by his hatred of authoritarian leaders and their bureaucratic henchmen, and his rage at the death of his father right at the end of World War II.',
  music: 'Dark Side of the Moon',
  user: pablo,
  image: "https://upload.wikimedia.org/wikipedia/en/3/3b/Dark_Side_of_the_Moon.png",
  url: 'https://open.spotify.com/album/4LH4d3cOWNNsVw41Gqt2kv?si=vXOVXx1bTPSe5cqUy35I2g'
)
post.save!


p post = Post.new(
  id: 142,
  title: 'A Cultural Masterpiece',
  content: 'And yet, the question remains: what makes the album so extraordinary? On the one hand, the album’s lyrics are an element that contributes to Channel Orange’s greatness. There are four aspects of the album’s lyrics that make them stand out over 2010s music: they uniquely reference cultural art pieces, they discuss social issues and inequality, they raise awareness about the LGBT+ community, and they show a strong cohesion that unites the album under a common mood, tone, and harmony.',
  music: 'Channel Orange',
  user: victor,
  image: "https://m.media-amazon.com/images/I/51Mp2uc8UFL._SL1400_.jpg",
  url: 'https://open.spotify.com/album/392p3shh2jkxUxY2VHvlH8?si=ijCPoKb9SvyGFFXYQ1Atjg'
)
post.save!

p post = Post.new(
  id: 143,
  title: 'I love Grunge!',
  content: 'Nevermind popularized the Seattle grunge movement and brought alternative rock 🎸 as a whole into the mainstream, establishing its commercial and cultural viability and leading to an alternative rock boom in the music industry. Its success surprised Nirvana\'s contemporaries, who felt dwarfed by its impact.',
  music: 'Nevermind',
  artist: 'Nirvana',
  user: ana,
  image: "https://m.media-amazon.com/images/I/71DQrKpImPL._SL1400_.jpg",
  url: 'https://open.spotify.com/album/2guirTSEqLizK7j9i1MTTZ?si=Bx4fuMpCTRy-aDJzxPrcTw'
)
post.save!

p post = Post.new(
  id: 144,
  title: 'Love this song',
  content: 'Nathy Peluso es una de las artistas más relevantes de la nueva generación. Argentina criada en España, con apenas veinticinco años ha conseguido ser reconocida por el público gracias a su reinterpretación de la mezcla de géneros musicales como el hip-hop, el jazz, o el folklore latinoamericano a través de a su prodigiosa voz y a su capacidad de comportarse como una gran diva de los años 50 al estilo de Nina Simone o Ella Fitzgerald, pero también como la artista urbana hija del tiempo que le toca vivir generacionalmente. ',
  music: 'Vivir Así Es Morir de Amor',
  artist: 'Nathy Peluso',
  user: nicky,
  image: "https://i.scdn.co/image/ab67616d0000b273add9c3004bd90375b28696a2",
  url: 'https://open.spotify.com/track/75HnDKDqsmEzdOKFWe5FZS?si=af243e937b2447c7'
)
post.save!

p post = Post.new(
  id: 145,
  title: 'My Favorite German Rapper',
  content: 'Bushido ist der Sohn eines tunesischen Vaters und einer deutschen Mutter. Sein Vater war in den früheren 70ern aus der tunesischen Hauptstadt Tunis nach Düsseldorf gezogen.[1] Er verließ die Familie, als der Sohn drei Jahre alt war. Bushido hatte zu ihm danach zunächst keinen Kontakt mehr und wuchs bei seiner alleinerziehenden Mutter im Berliner Bezirk Tempelhof auf. Nach der Grundschule besuchte er bis zur elften Klasse zwei Tempelhofer Gymnasien.',
  music: 'Bushido',
  user: lenny,
  image: "https://i1.sndcdn.com/artworks-Z8tUgu5jOwqiNayw-Ffkd9g-t500x500.jpg",
  url: 'https://open.spotify.com/artist/3c96G4d2lUOxhomM2mby5S?si=YKAa36EESsuNXb2q88L40g'
)
post.save!

p post = Post.new(
  id: 146,
  title: 'Techno Bunker',
  content: 'Welcome to the dark side of the club 🍾. If you want me to put you on the list, dm me!',
  music: 'Techno playlist',
  user: isa,
  image: "https://wololosound.com/wp-content/uploads/xoyo-e1586201348254.jpg",
  url: 'https://open.spotify.com/playlist/37i9dQZF1DX6J5NfMJS675?si=35f95cb548fc45fe'
)
post.save!

p post = Post.new(
  id: 147,
  title: 'RIP Vincente Fernandez',
  content: 'I love mariachi and I wanted to share Vincente Fernandez since he died recently 🪦',
  music: 'Vincente Fernandez',
  user: mojito,
  image: "https://www.biografiasyvidas.com/biografia/f/fotos/fernandez_vicente_1.jpg",
  url: 'https://open.spotify.com/artist/4PPoI9LuYeFX8V674Z1R6l?si=DTrbbEtKTzmDw4gsZ15kAQ'
)
post.save!

p comment = PostComment.new(
  user_id: 101,
  post_id: 156,
  content: 'I\'ve learned to code and now I\'m going to change my life 🥲'
)
comment.save!

p comment = PostComment.new(
  user_id: 112,
  post_id: 156,
  content: 'You guys are the best batch ever, going to find a new pigeon 🐦 to save now that I don\'t have you guys anymore'
)
comment.save!

p comment = PostComment.new(
  user_id: 113,
  post_id: 156,
  content: 'Who am I going to bully now that you guys are leaving me. Also CHECK YOUR SLACK'
)
comment.save!

p comment = PostComment.new(
  user_id: 102,
  post_id: 156,
  content: 'I\'m going to miss my best friends @pierre and @carlotta 😭'
)
comment.save!

p comment = PostComment.new(
  user_id: 103,
  post_id: 156,
  content: 'I\'m going to miss my best friends @pierre and @carlotta 😭'
)
comment.save!

p comment = PostComment.new(
  user_id: 104,
  post_id: 156,
  content: 'I\'m going back to Germany 😢'
)
comment.save!

p comment = PostComment.new(
  user_id: 106,
  post_id: 157,
  content: 'Can I make a cortado for you?'
)
comment.save!

p comment = PostComment.new(
  user_id: 109,
  post_id: 157,
  content: 'See you at Lula!!!'
)
comment.save!

p comment = PostComment.new(
  user_id: 110,
  post_id: 157,
  content: 'Che Boludo!!!'
)
comment.save!

p comment = PostComment.new(
  user_id: 100,
  post_id: 156,
  content: 'Thanks fanny! I\'ve made so many friends at LeWagon and can\'t wait to see what happens outside of the bootcamp'
)
comment.save!

p comment = PostComment.new(
  user_id: 100,
  post_id: 153,
  content: 'So excited for the party, should I bring something?'
)
comment.save!

p comment = PostComment.new(
  user_id: 109,
  post_id: 153,
  content: 'Are we going to Lula or Lula?'
)
comment.save!

p comment = PostComment.new(
  user_id: 110,
  post_id: 153,
  content: 'Can we work on the playlsit for the party??'
)
comment.save!

p comment = PostComment.new(
  user_id: 102,
  post_id: 153,
  content: 'Can\'t wait to get waaaaaasted'
)
comment.save!

p comment = PostComment.new(
  user_id: 112,
  post_id: 149,
  content: 'This is siiiiick, let\'s go to a rave soon!'
)
comment.save!

p comment = PostComment.new(
  user_id: 114,
  post_id: 149,
  content: 'Thank you for sharing, I think @emi would be interested since she\'s Bulgarian'
)
comment.save!

p comment = PostComment.new(
  user_id: 112,
  post_id: 148,
  content: 'Thanks for the stickers @emi!! See you at the march!'
)
comment.save!

p comment = PostComment.new(
  user_id: 113,
  post_id: 148,
  content: 'Can you give details for the march?'
)
comment.save!

p "Finished Seeding!"
