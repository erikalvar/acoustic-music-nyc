# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Order: User, Tags, Events, EventTags

User.create(username: "erik", email: "erik@gmail.com", password_digest: "hkjhyr5uyt66uygj", moderator: true)
User.create(username: "garrett", email: "garrett@gmail.com", password_digest: "hkjhyr5uyt66uygj", moderator: false)
User.create(username: "chris", email: "chris@gmail.com", password_digest: "hkjhyr5uyt66uygj", moderator: false)
User.create(username: "wayne", email: "wayne@gmail.com", password_digest: "hkjhyr5uyt66uygj", moderator: true)
User.create(username: "sam", email: "sam@gmail.com", password_digest: "hkjhyr5uyt66uygj", moderator: false)

Tag.create(name: "irish")
Tag.create(name: "bluegrass")
Tag.create(name: "gypsy jazz")
Tag.create(name: "folk")
Tag.create(name: "country")
Tag.create(name: "jam")
Tag.create(name: "open mic")
Tag.create(name: "workshop")
Tag.create(name: "singer-songwriter")
Tag.create(name: "western swing")
Tag.create(name: "session")

Event.create(
  title: "Ham Rodeo",
  venue: "Skinny Dennis",
  description: "Ham Rodeo plays their regular Friday night slot from 10pm-1am for some honky tonk, western swing music. Be ready for some two-stepping!",
  venue_address: "152 Metropolitan Ave, Brooklyn, NY 11211",
  tickets_url: "https://www.skinnydennisbar.com/",
  image_url: "https://symphonyspace.s3.amazonaws.com/images/_mediaCarousel/7198/hamrodeomain.jpg?mtime=20181127120100",
  user_id: 2,
  moderator_id: 1,
  # start_time: DateTime.strptime("07/012/2020 20:00", "%m/%d/%Y %H:%M"),
  # end_time: DateTime.strptime("07/03/2020 01:00", "%m/%d/%Y %H:%M")
)
Event.create(
  title: "Cole Quest & the City Pickers",
  venue: "Rockwood Stage 3",
  description: "Cole Quest & the City Pickers bring their eclectic mix of bluegrass, folk, and Americana to Rockwood on dobro, banjo, bass, guitar, and harmonica",
  venue_address: "185 Orchard St, New York, NY 10002",
  tickets_url: "https://rockwoodmusichall.com/",
  image_url: "https://www.woodyfest.com/wp-content/uploads/2020/03/10082_Banjo_Conveyor_W2_DSC_3157.NEF_.p1-1024x683.jpg",
  user_id: 4,
  moderator_id: 4,
  # start_time: DateTime.strptime("07/15/2020 18:00", "%m/%d/%Y %H:%M"),
  # end_time: DateTime.strptime("07/15/2020 19:00", "%m/%d/%Y %H:%M")
)
Event.create(
  title: "Ham Rodeo",
  venue: "Symphony Space",
  description: "Banjo Roundtable w/ Béla Fleck, Seamus Egan, Abigail Washburn, and Don Vappie.",
  venue_address: "152 Metropolitan Ave, Brooklyn, NY 11211",
  tickets_url: "https://www.symphonyspace.org/events",
  image_url: "https://www.mcall.com/resizer/6Mx3vK4kGTO4gMUAqU0vbiDXo1U=/800x533/top/arc-anglerfish-arc2-prod-tronc.s3.amazonaws.com/public/V2C5K5H4ZNFCRLROVPDR24TF7I.jpg",
  user_id: 5,
  moderator_id: 1,
  # start_time: DateTime.strptime("07/16/2020 17:00", "%m/%d/%Y %H:%M"),
  # end_time: DateTime.strptime("07/16/2020 19:00", "%m/%d/%Y %H:%M")
)

EventTag.create(event_id: 1, tag_id: 5)
EventTag.create(event_id: 1, tag_id: 10)
EventTag.create(event_id: 2, tag_id: 2)
EventTag.create(event_id: 2, tag_id: 4)
EventTag.create(event_id: 2, tag_id: 5)
EventTag.create(event_id: 2, tag_id: 9)
EventTag.create(event_id: 3, tag_id: 1)
EventTag.create(event_id: 3, tag_id: 2)
EventTag.create(event_id: 3, tag_id: 4)
EventTag.create(event_id: 3, tag_id: 8)