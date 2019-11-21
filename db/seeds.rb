# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Timelink.destroy_all
Tagging.destroy_all
MapTagging.destroy_all
Tag.destroy_all
Map.destroy_all
Card.destroy_all
World.destroy_all
User.destroy_all

user = User.create!(email: "user@email.com", password: "password", username: "user")

url = "https://cnet3.cbsistatic.com/img/fwX4_HgkOmrmdL3jfknt41h9YZU=/1092x0/2019/08/24/8656b6d6-57a9-48da-b00d-b83d2dd0c344/ecwe-nmu0aaqbms.jpg"
star_wars = World.create!(name: "Star Wars", description: "In a Galaxy far far away...", user_id: user.id)
star_wars.remote_photo_url = url
star_wars.save

url2 = "https://image.smythstoys.com/original/desktop/150739_4.jpg"
my_little_pony = World.create!(name: "My Little Pony", description: "Friendship is Magic", user_id: user.id)
my_little_pony.remote_photo_url = url2
my_little_pony.save

url4 = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/White_Hart_Lane_from_South_End.JPG/1920px-White_Hart_Lane_from_South_End.JPG"
pitch = World.create!(name: "The Pitch", description:"Absolute pitch (AP), often called perfect pitch, is a rare ability of a person to identify or re-create a given musical note without the benefit of a reference tone. AP can be demonstrated via linguistic labeling ('naming' a note), auditory imagery, or sensorimotor responses. For example, an AP possessor can accurately reproduce a heard tone on a musical instrument without 'hunting' for the correct pitch. The frequency of AP in the general population is not known. The assumed occurrence of less than 1:10.000 is widely reported, but it is not supported by evidence. However, a review of more recent and international studies indicates prevalence of at least 4% amongst music students.", user_id: user.id)
pitch.remote_photo_url = url4
pitch.save

# STAR WARS

jabba_tag = Tag.create!(world_id: star_wars.id, name: "jabba")
luke_tag = Tag.create!(world_id: star_wars.id, name: "luke skywalker")
leia_tag = Tag.create!(world_id: star_wars.id, name: "leia organa")
han_tag = Tag.create!(world_id: star_wars.id, name: "han solo")
character_tag = Tag.create!(world_id: star_wars.id, name: "character")
event_tag = Tag.create!(world_id: star_wars.id, name: "event")

url3 = "https://vignette.wikia.nocookie.net/battlefront/images/f/f9/Jabba%27s_Palace.PNG/revision/latest?cb=20110228035943"
map = Map.new(title: "Jabba's place", world_id: star_wars.id)
map.remote_photo_url = url3
map.save
MapTagging.create!(tag_id: jabba_tag.id, map_id: map.id)


jabba_content = "Jabba Desilijic Tiure, more commonly referred to as Jabba the Hutt or simply Jabba, and formally styled as His Excellency Jabba Desilijic Tiure of Nal Hutta, Eminence of Tatooine, was a Hutt gangster and crime lord, as well as a member of the Grand Hutt Council, who operated and led a criminal empire from his palace on the Outer Rim world of Tatooine. Jabba was a major figure on Tatooine, where he controlled the bulk of the trafficking in illegal goods, piracy and slavery that generated most of the planet's wealth. He was also highly influential in the entire Outer Rim as one of its most powerful crime lords."
jabba_card = Card.create!(world_id: star_wars.id, title: "Jabba", content: jabba_content)
Tagging.create!(tag_id: jabba_tag.id, card_id: jabba_card.id)
Tagging.create!(tag_id: character_tag.id, card_id: jabba_card.id)


luke_content = "Luke Skywalker, a Force-sensitive human male, was a legendary Jedi Master who fought in the Galactic Civil War during the reign of the Galactic Empire. Along with his companions, Princess Leia Organa and Captain Han Solo, Skywalker served on the side of the Alliance to Restore the Republic—an organization committed to the downfall of Emperor Palpatine and the restoration of democracy. Following the war, Skywalker became a living legend, and was remembered as one of the greatest Jedi in galactic history."
luke_card = Card.create!(world_id: star_wars.id, title: "Luke Skywalker", content: luke_content)
Tagging.create!(tag_id: luke_tag.id, card_id: luke_card.id)
Tagging.create!(tag_id: character_tag.id, card_id: luke_card.id)


leia_content = "Leia Organa, a Force-sensitive human female, was a princess of Alderaan, a member of the Imperial Senate, a leader of the Alliance to Restore the Republic, a member of the Galactic Senate, and general of the Resistance. Born alongside her twin brother, Luke Skywalker in the year 19 BBY as Leia Amidala Skywalker, she was the daughter of the Jedi Knight Anakin Skywalker and Senator Padmé Amidala of Naboo. As a result of her father's fall to the dark side of the Force, the Skywalker children were separated with Leia becoming the adopted daughter of Senator Bail Organa and his wife, Queen Breha Organa, who renamed her Princess Leia Organa."
leia_card = Card.create!(world_id: star_wars.id, title: "Leia Organa", content: leia_content)
Tagging.create!(tag_id: leia_tag.id, card_id: leia_card.id)
Tagging.create!(tag_id: character_tag.id, card_id: leia_card.id)


han_content = "Han Solo, known only as Han until being given the surname Solo by chief recruitment officer Drawd Munbrin, and also known as Cadet 124-329 when serving as an Imperial cadet, was a human male smuggler who became a leader in the Alliance to Restore the Republic and an instrumental figure in the defeat of the Galactic Empire during the Galactic Civil War. He hailed from Corellia and became a smuggler in the employ of Jabba the Hutt, even completing the Kessel Run in just twelve parsecs with his prized ship, the Millennium Falcon. He was the son-in-law of fallen Jedi Knight Anakin Skywalker and Senator Padmé Amidala, husband of Princess Leia Organa, brother-in-law of Jedi Master Luke Skywalker, father of Ben Solo, rivals and close friends with fellow smuggler Lando Calrissian, and best friends with the Wookiee Chewbacca, his trusted copilot who swore a life debt to the Corellian smuggler. Solo ran afoul of Jabba after ditching a shipment of spice to avoid trouble with the Empire, owing the Hutt a great deal of money as a result. His fortune seemed to have changed when he agreed to charter Luke Skywalker, Obi-Wan Kenobi, and the droids R2-D2 and C-3PO to Alderaan, but he became caught up in the rebellion against the Empire and, after helping Leia Organa escape from the Death Star, briefly fought in the Battle of Yavin, which allowed Skywalker to destroy the superweapon. Solo fought with the Rebellion for a number of years afterward, taking part in numerous operations and battles against the Empire."
han_card = Card.create!(world_id: star_wars.id, title: "Han Solo", content: han_content)
Tagging.create!(tag_id: han_tag.id, card_id: han_card.id)
Tagging.create!(tag_id: character_tag.id, card_id: han_card.id)


event_content = "In 4 ABY, the rebel droids C-3PO and R2-D2 traveled to Jabba's Palace under Luke Skywalker's instructions as part of a mission to rescue Han Solo. Skywalker offered the droids as a gift in an attempt to secure the release of Solo, who was frozen in carbonite. As expected, Jabba refused and pressed the droids into his service. Later, Leia Organa arrived disguised as the bounty hunter Boushh with the captive Wookiee Chewbacca, Solo's co-pilot. She was joined by Lando Calrissian, who was disguised as one of Jabba's guards.[3]

Leia managed to free Han from carbonite but was captured by Jabba. The following day, Skywalker arrived and reiterated his demand to free Solo and his friends. Jabba refused and threw Skywalker down the trapdoor to the rancor[3] Pateesa.[14] who also killed the Gamorrean guard Jubnuk. Skywalker managed to kill Pateesa by collapsing the dividing door on top of the rancor. Jabba attempted to feed Skywalker, Solo, and Chewbacca to the sarlacc at the Great Pit of Carkoon. However, the rebels escaped and killed Jabba and his henchmen, dealing a blow to his criminal empire.[3]"
event_card = Card.create!(world_id: star_wars.id, title: "Rescuing Han Solo", content: event_content, is_event: true)
Tagging.create!(tag_id: han_tag.id, card_id: event_card.id)
Tagging.create!(tag_id: event_tag.id, card_id: event_card.id)
Tagging.create!(tag_id: jabba_tag.id, card_id: event_card.id)
Tagging.create!(tag_id: luke_tag.id, card_id: event_card.id)
Tagging.create!(tag_id: leia_tag.id, card_id: event_card.id)



test_event_tag = Tag.create!(world_id: star_wars.id, name: "wonky timeline")
select_event_tag = Tag.create!(world_id: star_wars.id, name: "selected events")


event0_card = Card.create!(world_id: star_wars.id, title: "Action start!", content: "Start!", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event0_card.id)


event1a_card = Card.create!(world_id: star_wars.id, title: "first fork: choice 1", content: "LEVEL 1", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event1a_card.id)
Tagging.create!(tag_id: select_event_tag.id, card_id: event1a_card.id)

event1b_card = Card.create!(world_id: star_wars.id, title: "first fork: choice 2 - LOOP START", content: "LEVEL 1", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event1b_card.id)
Tagging.create!(tag_id: select_event_tag.id, card_id: event1b_card.id)


event2a_card = Card.create!(world_id: star_wars.id, title: "ending 1", content: "LEVEL 2", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event2a_card.id)

event2b_card = Card.create!(world_id: star_wars.id, title: "the adventure continues", content: "LEVEL 2", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event2b_card.id)

event2c_card = Card.create!(world_id: star_wars.id, title: "WHOOO LOOPING", content: "LEVEL 2", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event2c_card.id)
Tagging.create!(tag_id: select_event_tag.id, card_id: event2c_card.id)


event3a_card = Card.create!(world_id: star_wars.id, title: "ending 2", content: "LEVEL 3", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event3a_card.id)
Tagging.create!(tag_id: select_event_tag.id, card_id: event3a_card.id)

event3b_card = Card.create!(world_id: star_wars.id, title: "MORE LOOPING", content: "LEVEL 3", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event3b_card.id)
Tagging.create!(tag_id: select_event_tag.id, card_id: event3b_card.id)


event4a_card = Card.create!(world_id: star_wars.id, title: "and on and on", content: "LEVEL 4", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event4a_card.id)

event4b_card = Card.create!(world_id: star_wars.id, title: "ending 3", content: "LEVEL 4", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event4b_card.id)

event4c_card = Card.create!(world_id: star_wars.id, title: "STILL LOOPING", content: "LEVEL 4", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event4c_card.id)


event5a_card = Card.create!(world_id: star_wars.id, title: "ending 4", content: "LEVEL 5", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event5a_card.id)
Tagging.create!(tag_id: select_event_tag.id, card_id: event5a_card.id)

event5b_card = Card.create!(world_id: star_wars.id, title: "ending 5", content: "LEVEL 5", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event5b_card.id)

event5c_card = Card.create!(world_id: star_wars.id, title: "AND ANOTHER EVENT OF... LOOPING!", content: "LEVEL 5", is_event: true)
Tagging.create!(tag_id: test_event_tag.id, card_id: event5c_card.id)


Timelink.create!(parent_event: event0_card, child_event: event1a_card)
Timelink.create!(parent_event: event0_card, child_event: event1b_card)

Timelink.create!(parent_event: event1a_card, child_event: event2a_card)
Timelink.create!(parent_event: event1a_card, child_event: event2b_card)
Timelink.create!(parent_event: event1b_card, child_event: event2c_card)

Timelink.create!(parent_event: event2b_card, child_event: event3a_card)
Timelink.create!(parent_event: event2c_card, child_event: event3b_card)

Timelink.create!(parent_event: event3b_card, child_event: event4a_card)
Timelink.create!(parent_event: event3b_card, child_event: event4b_card)
Timelink.create!(parent_event: event3b_card, child_event: event4c_card)

Timelink.create!(parent_event: event4a_card, child_event: event5a_card)
Timelink.create!(parent_event: event4a_card, child_event: event3a_card)
Timelink.create!(parent_event: event4a_card, child_event: event5b_card)
Timelink.create!(parent_event: event4c_card, child_event: event5c_card)

Timelink.create!(parent_event: event5c_card, child_event: event1b_card)
# ___________________________________________________________

# PITCH
url5 = "https://images-na.ssl-images-amazon.com/images/I/81qB66B7bsL._SX450_.jpg"
map_pitch = Map.new(title: "Pitch", world_id: pitch.id)
map_pitch.remote_photo_url = url5
map_pitch.save
# MapTagging.create!(tag_id: jabba_tag.id, map_id: map.id)

# tags
character_tag2 = Tag.create!(world_id: pitch.id, name: "character")
event_tag2 = Tag.create!(world_id: pitch.id, name: "event")
location_tag2 = Tag.create(world_id: pitch.id, name: "location")
olivia_tag = Tag.create(world_id: pitch.id, name: "olivia")
corentin_tag = Tag.create(world_id: pitch.id, name: "corentin")
nicola_tag = Tag.create(world_id: pitch.id, name: "nicola")
arnaut_tag = Tag.create(world_id: pitch.id, name: "arnaut")
you_tag = Tag.create(world_id: pitch.id, name: "you")
speak_tag = Tag.create(world_id: pitch.id, name: "mouthwords")
click_tag = Tag.create(world_id: pitch.id, name: "clickmagic")
# notes

me_content = "Sometimes I'll start a sentence, and I don't even know where it's going. I just hope I find it along the way. Like an improv conversation. An improversation."
me_card = Card.create!(world_id: pitch.id, title: "The Pitcher", content: me_content)
Tagging.create!(tag_id: character_tag2.id, card_id: me_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: me_card.id)


support_content = "Ik ben blij dat gij in mijn team zit."
support_card = Card.create!(world_id: pitch.id, title: "The Unsung Heroes", content: support_content)
Tagging.create!(tag_id: character_tag2.id, card_id: support_card.id)
Tagging.create!(tag_id: olivia_tag.id, card_id: support_card.id)
Tagging.create!(tag_id: nicola_tag.id, card_id: support_card.id)


audience_content = "*Shout the region we're presenting in, followed by a generic and totally 'genuine' remark that this audience is the best we've seen, that we love them and that this would not have been possible without them*"
audience_card = Card.create!(world_id: pitch.id, title: "Audience", content: audience_content)
Tagging.create!(tag_id: character_tag2.id, card_id: audience_card.id)
Tagging.create!(tag_id: you_tag.id, card_id: audience_card.id)


google_content = "How does any genius figure out his inventions? I mean, how did Leonardo DiCaprio figure out about gravity? 'Cause the *censored* was sleepin' underneath a tree and an apple hit him on his head."
google_card = Card.create!(world_id: pitch.id, title: "Google Digital Atelier", content: google_content)
Tagging.create!(tag_id: location_tag2.id, card_id: google_card.id)
Tagging.create!(tag_id: you_tag.id, card_id: google_card.id)
Tagging.create!(tag_id: olivia_tag.id, card_id: google_card.id)
Tagging.create!(tag_id: nicola_tag.id, card_id: google_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: google_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: google_card.id)


opening_content = "*insert bold statement here*"
opening_card = Card.create!(world_id: pitch.id, title: "Bold statement", content: opening_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: opening_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: opening_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: opening_card.id)


statistic_content = "*insert mind-blowing statistic here*"
statistic_card = Card.create!(world_id: pitch.id, title: "Mind-blowing statistic", content: statistic_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: statistic_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: statistic_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: statistic_card.id)


segway_content = "*insert clever segway here*"
segway_card = Card.create!(world_id: pitch.id, title: "Clever segway", content: segway_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: segway_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: segway_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: segway_card.id)


painpoint_content = "The painpoint is unstructured notes, lack of acessibility to structuring tools that are scalable and aren't timeconsuming. Really focus on the 'niche' of storytellers-creators like writers/videogame designers/etc., even though the app can be used for a multitude of things."
painpoint_card = Card.create!(world_id: pitch.id, title: "Pain point", content: painpoint_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: painpoint_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: painpoint_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: painpoint_card.id)


worldpage_content = ""
worldpage_card = Card.create!(world_id: pitch.id, title: "Display World page", content: worldpage_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: worldpage_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: worldpage_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: worldpage_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: worldpage_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: worldpage_card.id)


deleteworld_content = "Destroy all evidence of the Pitcher being a Brony"
deleteworld_card = Card.create!(world_id: pitch.id, title: "Burn a World", content: deleteworld_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: deleteworld_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: deleteworld_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: deleteworld_card.id)


cardpage_content = ""
cardpage_card = Card.create!(world_id: pitch.id, title: "Display notes", content: cardpage_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: cardpage_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: cardpage_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: cardpage_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: cardpage_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: cardpage_card.id)


createcard_content = "Whoopsiedaisy I forgot my assistant"
createcard_card = Card.create!(world_id: pitch.id, title: "Create note", content: createcard_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: createcard_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: createcard_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: createcard_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: createcard_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: createcard_card.id)


mappage_content = "I want yooouuu, to show me the waaaay! (everyday)"
mappage_card = Card.create!(world_id: pitch.id, title: "Display map", content: mappage_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: mappage_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: mappage_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: mappage_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: mappage_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: mappage_card.id)


placemarker_content = "NAVIGATED B*RITCHES*"
placemarker_card = Card.create!(world_id: pitch.id, title: "Marker", content: placemarker_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: placemarker_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: placemarker_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: placemarker_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: placemarker_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: placemarker_card.id)


timeline_content = "Dr. Who would approve"
timeline_card = Card.create!(world_id: pitch.id, title: "Show timeline", content: timeline_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: timeline_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: timeline_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: timeline_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: timeline_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: timeline_card.id)


getlost_content = "Ooh no I missed my next train of thought"
getlost_card = Card.create!(world_id: pitch.id, title: "Get lost", content: getlost_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: getlost_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: getlost_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: getlost_card.id)
Tagging.create!(tag_id: you_tag.id, card_id: getlost_card.id)


loseit_content = "This is fine."
loseit_card = Card.create!(world_id: pitch.id, title: "NO GOD NOO", content: loseit_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: loseit_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: loseit_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: loseit_card.id)
Tagging.create!(tag_id: you_tag.id, card_id: loseit_card.id)


saviour_content = "I saved a life: my own. Am I a hero? I really can't say... but, yes."
saviour_card = Card.create!(world_id: pitch.id, title: "The Rescue", content: saviour_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: saviour_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: saviour_card.id)
Tagging.create!(tag_id: olivia_tag.id, card_id: saviour_card.id)
Tagging.create!(tag_id: nicola_tag.id, card_id: saviour_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: saviour_card.id)
Tagging.create!(tag_id: you_tag.id, card_id: saviour_card.id)


ending_content = "Cut to black. Audience goes f*udging* apesh*ivers*."
ending_card = Card.create!(world_id: pitch.id, title: "The end", content: ending_content, is_event: true)
Tagging.create!(tag_id: event_tag2.id, card_id: ending_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: ending_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: ending_card.id)
Tagging.create!(tag_id: you_tag.id, card_id: ending_card.id)

# TIMELINKS

Timelink.create!(parent_event: opening_card, child_event: statistic_card)
Timelink.create!(parent_event: statistic_card, child_event: segway_card)
Timelink.create!(parent_event: segway_card, child_event: painpoint_card)
Timelink.create!(parent_event: painpoint_card, child_event: worldpage_card)
Timelink.create!(parent_event: worldpage_card, child_event: deleteworld_card)
Timelink.create!(parent_event: deleteworld_card, child_event: cardpage_card)
Timelink.create!(parent_event: cardpage_card, child_event: createcard_card)
Timelink.create!(parent_event: createcard_card, child_event: mappage_card)
Timelink.create!(parent_event: mappage_card, child_event: placemarker_card)

#NORMAL TIMELINE

Timelink.create!(parent_event: placemarker_card, child_event: timeline_card)
Timelink.create!(parent_event: timeline_card, child_event: ending_card)

# BRANCH

Timelink.create!(parent_event: placemarker_card, child_event: getlost_card)
Timelink.create!(parent_event: getlost_card, child_event: loseit_card)
Timelink.create!(parent_event: loseit_card, child_event: saviour_card)
Timelink.create!(parent_event: loseit_card, child_event: getlost_card)
Timelink.create!(parent_event: saviour_card, child_event: timeline_card)


