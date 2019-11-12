# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Tagging.destroy_all
Tag.destroy_all
Map.destroy_all
Card.destroy_all
World.destroy_all
User.destroy_all

user = User.create!(email: "user@email.com", password: "password", encrypted_password: "password", username: "user")

star_wars = World.create!(name: "Star Wars", description: "In a Galaxy far far away...", user_id: user.id)

jabba_tag = Tag.create!(world_id: star_wars.id, name: "jabba")
luke_tag = Tag.create!(world_id: star_wars.id, name: "luke skywalker")
leia_tag = Tag.create!(world_id: star_wars.id, name: "leia organa")
han_tag = Tag.create!(world_id: star_wars.id, name: "han solo")
map_tag = Tag.create!(world_id: star_wars.id, name: "map")
character_tag = Tag.create!(world_id: star_wars.id, name: "character")
event_tag = Tag.create!(world_id: star_wars.id, name: "event")


map = Map.create!(image_url: "https://vignette.wikia.nocookie.net/battlefront/images/f/f9/Jabba%27s_Palace.PNG/revision/latest?cb=20110228035943", title: "Jabba's place", world_id: star_wars.id)
# Tagging.create!(tag_id: jabba_tag.id, card_id: map.id)
# Tagging.create!(tag_id: map_tag.id, card_id: map_card.id)


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
event_card = Card.create!(world_id: star_wars.id, title: "Rescuing Han Solo", content: event_content)
Tagging.create!(tag_id: han_tag.id, card_id: event_card.id)
Tagging.create!(tag_id: event_tag.id, card_id: event_card.id)
Tagging.create!(tag_id: jabba_tag.id, card_id: event_card.id)
Tagging.create!(tag_id: luke_tag.id, card_id: event_card.id)
Tagging.create!(tag_id: leia_tag.id, card_id: event_card.id)

