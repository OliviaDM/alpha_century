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

url4 = "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEhUSExMWFhUXGB0ZFxgYGBYWGBoaFxgYGh0XGhgYHSggGBolGxcYITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQGy0lHx8tLS0tLS0uLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLf/AABEIAK4BIgMBIgACEQEDEQH/xAAbAAACAgMBAAAAAAAAAAAAAAADBAAFAQIGB//EAEMQAAEDAgMECAQDBwIEBwAAAAEAAhEDIQQSMQVBUWETInGBkaGx8AYywdFCUuEUI2JygpLxM0MWU8PiFTREVIOTov/EABkBAAMBAQEAAAAAAAAAAAAAAAABAgMEBf/EACsRAAICAQMDAwIHAQAAAAAAAAABAhESAyExBEFRExSRYaEiMkJSYoHwwf/aAAwDAQACEQMRAD8A6TKplRsqmRenZ5gHKplRsimRFgByrGVHyKZEWADIpkR8qmROwAZFMiPkWMiLEByrGRMZFjIiwAZFMqPlUyIsBfKplR8imRFgL5FMiPkUyJ2IBlWMiYyLGRAAMizlRsizkRYAMqmVHyKZEgAZVMqPkUyIsAGVTIj5FMiLABlUyo+RTIgAGVTIj5FjIgAOVTKjZFMqBgcqmVGyKZUWAHKojZFEWA5kUyI+VTKsrLoBkUyJjIpkRYUL5FMiYyKZE7ChfIs5EfIs5EWKhbIpkTORTIiwoWyKZEz0anRoyChbIsZE10anRp5CFMinRpro1OjRkFCvRqdGmujU6NGQhTo1OjTfRrHRoyChXo1nImujU6NGQ6FcinRpro1jo0ZCoVyKZE10anRoyHQrkUyJro1OjRkFCvRrGRN5Fjo0ZCoVyKZE1kWMiMh0LZFMiZyKZErChbIpkTIasFqMh0L5FhMZFEZBQ3lUypXDbXw72Co2qzKd5cGkTuIdBB5FPMIIkXB0IuPFc+aZvgaZVnKt4WA8TEieCMwwNcqzlW8KAjijMWBplUyonJC/aGQ4hwOX5ouRHIIzHgZyKZEHZ+Pp1gTTJMGDLXNIMTEOAO9Hq1WtGZxAHEp5iwJlUyrQYtlr66buN57lqzH0j+NveQN0z2QdUs0GAXIpkWrcVTOj2nscOMeqIajfzDxCeYsDTIs5ESEMVmESHNi41GoMEeKMwwJkWMi3a9p0IPYVsjMMAWRTIiwpCMwwBZFMiKI4qAIzH6YLIpkRSFkM4BGYsAGRTIi5VmEZhgByKZEUBTKjMMAWRYyI0LEIzDADkUyI2Q8D4LVGYYAsqxkRSFiEZBiCyrGVGhalGQYg8qi2zDiFEZBieLYXZ5xD8tMZY3/NPEGSOPHcE252Iw4LBWfExA6t73axs3581nZODq0XuJqUw0mRlrhrrTYnoyT2SB27uk2gc7g7JQOhDnSXHQxmaW2Xl3FUjuUbEKeKxNJra1fHVabHWGZzWku3D95INgd25WmOqOaA59XFAOJaHNfSZJcDIzCnrftG5U22tmuxLmGoaAa22Roc1rt8mHST3ouz6Famzon16VWm1xfFQZi0kC7TmGWw7LrXK1sn9xbD+x8M3EV6tEuxJewAtmuC+LAkOy6yR8vFSpsinVAqM6Z9MuIzOqj52uIInLOaWlK1GYJ72lj4qZw4xUzAkmMogg3c4ReQY3rptnYsUczWUn5SQ4tLXO6wBbIlhi3okpLv/wBGlaKh2Bc92d3S5wIDjWGYDSxjRJ02t6N1VpqHLmBmsJzNMFp6szPqup2f8V06tZlGl/qO+UfL+Eu16MAWBWlPYdnhlNrRUc5zrvuXSZgiJvy00TtXx9grwcNX2ziMNXeylXawZgS4HO0mMwMESOGg4LXH/EVeq5g6RnRWHRsBa1okmTzkuPkrn432hTw808TRoPJaHknD5/m6jS3NVYA4XF1zOD+JcMGtd+yYAjh+z4YPsY/FipBt+X6T0rVhX5TPG7pnXNa12ajmzNogXDgyzhmvLZ1zb/VUW0KVek+oXtdlyuIOoy3iXCwuNLLDdsU3EvFKo5zgAdGy23VJbMAjt10KK7bhg5cK4G8HO4wSIzRkue9c0/xPYlasUtyow+NydfMJImOR7d33TtDa9QNy9IWjSSSNDI/m1803hsUKtWmKtA02E9dxL3xzAcNfFauwrw8mnS6occjujaJE2OnCFDi/IS1kldP4MO2rVGlYiA6AXmRc77wNUxhMTiOjNRhzUwTJHWaB8rs8DqySR1onUTClX9rd+GbRenSNv6modb9qa109RhHWhtFgI0h2UCRfQ8Uf2R6/8X8Bau0MS2CXOiQWyIkbssgSOsL8wnWfElcEDpmga6Tu0Nrhc+HPtenbS1K2mlraDwUGaPwf2s+jUra/UHr/AMH8HT0fijEZutVpxGmWDNoMzoR67kxiviGuAwCtTzGHEgCADEAkkhx1kc1zWEwdSoDlFMwb9WmDppcaI52TWP8At0z3Uj9E3N/uH61fofwdhT23hsoL6znuyAkBtMS60uAt1ifRbYbb+HPWDg3UyYNhFsszPDmuIdsuq0SadMQDfLRtry7Uq1m+KU/y0fsp35tF+72rB/B6BX29TI6uKYDeJplw15EHzSuyfiN2Zxdi6D2Ns6MPUp+DjVMHuK4ro+Apf20fss0sO50hrKbp6xAbSuRvMDn5q8peUR7qP7H8HpOI+LMIC5pOaGB+kzJNu3TxVVjNv4QPBhwBbNnOaCOMgiN/gVy1OiQBOz6ZO8gVWk9uV6FUZb/yWV4nK9vSy0E7g4kSNAeyZKacvKKfUQ8P4Opq7Xwz8zg6oACQ4jERfMLAF3MaLFLaeFYMxpuvaXYkD/qDn4di4Q7M4muN1xPDs4I+DZ0RJFSqOrlHVGnPrXTykL1tLz9j0bDfFdJrf3dNhA3l9NxEa3e6U/gPih1WoWAhvUziCycsx+Gd830XkbRf/VeL36gB8qkDwTTcTFSm9uIqgNBBEQTM7w8xrfsQ3J7FLqNLyehbV+KyC5lNrqrmiS4uApiQCBMy7UaCBxC5evtTGFznEtjc3pCADHCbhV1XF0XOzue7PEBxYCd9p1i5tzK3w+KpA5jiXAxHyVYi/AE8N6JNj9XSfdfIfF4nEnQxG5ryZ1udb6XStWvi8xHSCNwL92nHqmOCXxldrqpLa4LY3iqIMnTqk6R3nkn6eOaAP38kDi9t4P8ADbd5qd73BT0/K+wOm7EiDZo5Og6b5Ma71Kv7VkfnIzdWB0giC0neb7lWtoVX1Xtp1xlfMZ39I5xImC3tETwOhhWG0cXVDiWAuawtDy3NlZYASdBoVLcropONXYi2jiCJyM/uH3WUmduU99W++Daf7lFVTCkX1LY9elh30DWp9HUILminLiRGhJHAJF+zWvIa6q4QAA1zREhoBI60XhObTr1HO6SY4AWgKUsXTqjK+M3vTmsXqyFPT07qK2HqDalOi2i2ocrXZwMrZzCN5neFUYjaTy3I8vInRxabgRqWzMTv3niU9Te+lr12cd47xp5hI4+gHEvpmQfmG8HmPsq9xq9mS4RfYRpCm05g29jczcEOB7iAe5WLtuVSZzme130NlUubGqH4rJ6k/JS2VIscPisjxUZ1XjRwmRaLEngY711WGx1RzGuNRxJaD87uHb2ri6VFx/C49y67ZNAmmwZTIGgBPpyUub8lK+wZ1LOczgHHi4ZjHaQoWgG0DsACsKWz6n/Ld4R6og2JVJmAO1w+kqXP6lrTm+EchtqvFQCT8o38yqt9a+q7bFfBjqjy51ZrZ3AF26OS2pfANL8VZ57BH1KTkivb6j7HEbl1mAEU2fyj35q4pfA+FGpee8fZWlHYFFoAGYgWHW4diWaKXSzKBo6qrtsvig49nqF242PS/Kf7nfdYqbEw5HWYI/iLiPMpZoftpeUePuriFnD1CdAvVKmA2ez5m0B3NKWdidmAxFH/AOv/ALU8voT7ev1I5jYBOR2Yfi39it6TbaK4p4rAxLejjlT+wWwr4N1v3feyPUJZD9BfuRz2JALXcIPoVxHTQvXG4XCv0bRPcwrJ2Dhj/wCnpf2BGZXtW+GjyDp7qy2NVis3nI8j9V6S74dwn/t6fhC0b8M4WZFENI0Ic4R5p5oXtJ+SmptQnvvquifsKnuc8dhb9WlLu+H2/wDMf/UGn0ASyQn02ocNt2oRUaf4ezeVXvxZj5nD+o/ddptP4MNQgitcDey3k7mqbE/AVf8ADUpntzD6FXkiH0+ouxSsxhP4neJKe2S7OXZgHQBqAd/YtKnwhjG6MDv5XA+RKY2TgK1FzukpuaCBeDHinl9TN6clyhw4Vh/22f2N+3NYOzqR/wBtvgB6JwVBuI8VM4/ME8n5JxXgrDs2if8Abb/+voUhtHC0mARTFzGr/urbF4pjLk9g3lVge+qRPVbxGvcVSnLyS4R8L4E24amdadz+EOM98zCsqeAdUbVpNrPo9MDLQZaTeJECY80HE4plIZW/N7uT9FrgXueczjpp7HBX6kioQgnwcu/4JxzSQG0yBYHPExvgiywvSRtF3LwH2WFXryOqtIo8PVztBjlGqr8ZhSwy0WnnYqYGvBA4+o08VbtcHAWniL6LE5jTA4whuV8Hnf3KsaPw90nXa5jBN7mZ/lExbsVS/DQOO8W3cx6omA2i+k+xlvj3Hl6JNFwxv8R0zPhqg4RVcXH8zQB4zM+qfw3wzh2AHo8w4ySPC0eC02XtFlUWMHe3h9xzVxRrEaLJyfc9GOlCrigdLD0m/LTY3saB9Fu9ziIDo7kWpiWndkPG8H7Kn2ntd1H5qbo3G2U9hBSp9jTJRW+xZCk8/iju+6IynGr/AEXKf8UPc6GsjtJ+yHW2lVcLuslgzJ9TBHTYna9CmYfUv2E+ghIV/i6g35Q93gB4krz7HVzmdfj6oDato1VqCOeXVSfB3VX42/LRH9Tp8gAiv+IK50LWjkOzjK4IP8yunpmfD7J4oyetN9x3/wAQrmc1V3KDHkFV7bqnJJcSSeJ5/omqzo8JVRtpzuqN1/oghtvlieYaXWmXl71TmAqUg794CR7ud5C6nDYzCD5QwdoA9UNm2n06nzJIo9mtGSJvPqAmRTuIPAG/BXz8bS3uYewNnyF1X161A/KIdugQlZpLpUl+ZCLiRMzoSqNm0arXdWoW9hI3K/J4aR91zdb5tN6ZytUWdL4lxQuKpPbDh5ynKPxtiBqGO7RB8lzInXdf1W+U7xbROkC1JrhnoeD+Jy5rXGmL8HEespz/AIkpD5muHOxHqFxOx6pyQNxVjUuDy9JU4o0WvNdztsNjKdRoc02PcUXK1eaYvEVKRlji3sJHkmMN8RVx+MHtA+kKXA6I9Sq3PQujHuVMgXN7J2viKpgUg6NSCWgdpMgK+o4gzYAkameo3vMZkYM3jqKStGtbCtdq1p5uAI8wq+tsbDmYpNnjceABsratiCN2bnu7gqjam2KdL5ozcPunxwElGrkUm0fh6gz94XkcA6CD3CJXPYvFmCGGBxOqNtbapqOJJP0/QIFLCZyJdqJNjIB0ngTqAtI3W55+rKLf4UIYbZxeZMxNz71KsahFMSBpYDnuTb6YaIEcABPsqkx9cuOUGYtY6k6n6KjEycSTeVhJFRAzSkTv13cbK7weLkZhabd+/sXOtqR26hP4LGQYNmv8A7cgRfFhEbt4MgRO8TuSW0nMFwYdMOaPUW0Pf9ARjrQ4X04X4IeIo9I21nt+XmOCVgBwePyEFpIjQ6Edn2XQt+JKsdUN/mgmeevkuHPMb/ApnDYxzTIFt43H9Umky46so7JnWN21XJBLwf4cog+U+a6DY22GVBkPVcdab4LXfyk6+RXF0qzXDMPqCO37orWjS0cAk4msNeS53R2uK+GaL5NAik4/hd8p7DuXObToVKJIqMLSfA9/so+zPiGpTtUBqU+P42/cdviuuwuOpV6cdWrTNiDqOUHRK/JphDU3jyeQ1acyeK1pNvfgV6Btb4JY+X4Z3/xu3dh19e5cfjdnOpvyvaWnQT6jcR2JmEtNx5FqbIyndbRdDSF+UfRUtCnFjHzDt3aK/o2N7nzSZFGx0affu5VPtkgmBwP0Vw7frZVG0TJF92+EBRWzE6aiERtYm9vYWlbXu5rTiOCYy+wdaWj9UwXEtjiPJJ7PHVGidDoyzvt4WSHfk1IgGPyx5eS51wsYK6KtS19jgqVoidw09+SCQTHKOqW5+UdqlNvy80WnTtBG466ckBQzsTeZtZXNO3j5FU2zaLi+wzHTT0AXY4P4cPz13ZQR8o+Y92jUFw03Lg57EYN9Z+RjS47oE68dwHMq72Z8IU2Q6scz7fu2G39Th6BXpr0aDIH7pu82JP1XM7W+J3GWUB0bd7z/AKjuyPlnkmvobvTjp7z5Lvam1KOHbkMSNKNO0fznd5lcpj9p1K56xGUXaxsho7eJ5lVrOJ15oeJxjWjWTw3/AKJ0Yz1XLbsOftJpic7mjk4x4b1TY/Hl5mTraZJ7SeKXxWKc4yTPoOSDRYXEAXPu6aRm5Pgb2cSX/Lm1idx/MeMaxxV2zKARLuJm8k7yZklK4PDhgJ3bzx/RbVHg66RJ5AJ2SAx+LLRAu90hvJu9yqQ79EOvic7nPO+w5Ablhj9bpAb9IPf+VE7T2cCAeInXiogCjdrP3RacEEeCHEgjeEMe/wDCYHQbOxIeJ/ELHnzKsKjCeR3Qf0XM0K2RwfuPPxV3hnmbmxE3vYhSAPF4YkF7fmHzDiOMKqc86jTeFe1Kl5bc8dyQxuFkZ2A/xN+oCYC+GrObcGD5HkeKtsNig6wsfy28QqLLN93gQiWB320OhCAL4He06dn1+qPhMUWHM1xY8aEb+RH0Vdgq09V5ufxce3grAgH6FIabW51OzficOOWsMjtzh8pjefy+Kv6r6dZuSswOB32J7efrzXnFMTN/t5p/A7TqUzDesze07t9ioarg7dPXTVT+S12t8JEfvMOQ9uuU6jv+/iqd7i05SC08DYj7jmuowO1J6zHX4bwmsWyjXbFVon8wH0Fx2hCaZU+mT3j/AL/f5HF4iq4HS3L3ZVuKOY7x2/oulx3w85nWa6WbjqDyB0nkYKrH7Mvfzsjg5/RnfBSGjpx4olOkZ07exW9PZgm9+xM09mtm4PhdGRqul1H2EMM8NtoeCeFZsjSR3oj8AzTK4e+a1bggJJt3JWN9JM0rv5j36KrqU90DnBlWwwg/N6/RP4PYZeJtlGrtGjvO/wA019CPbzXOxzNLDuMAAzMARr9102y/hR7uvVIYw8bk9nsq2wzaNA9Roc7e46Dsade/wRMRtAAFz3T70TbSNYdN3kOYKhSoiKLAOLz8x+yp9r/EDGHKzrv38B2kaqq2htipUkNOVnme/cqgtJP393U7vkU9dR2h8kxmLfVOZ7pPkOQQgO+62cQNPFIV8QTLW2G86HuVo4223bN8ZjsphvzeQVVVqXnedT73Las46XH1WopkwNSd2/8ARUSCpUsxgC50Cu8NhuiGvW/EeHIe9yLg8J0Qk3cd/COCxWNgJ1N5vbigRnpLSfA87gKv2vWMCmPmddx4DgnatUNBe6IbpzKoHvJJefmPh2IA0DPALemJtHzFD4Ab/ZTWGbLxyQBdMLQAI05KJIvdxd4fqogCpxFGHkcZQA2Dc+id2qYLXTeEjVOjjf1TQBqUfJc3sm8PXJaQbEfKOWkBVrqhiRY+icfUNnt79PcJNAWVGrpP2v8AZHqEjrBKUZ+bd4j/AAmKT9JI5aExwPNIYni6MS9kAH5hHmEBgncI8fVP1Zmdx7fqgdFe2njHimFG1OmdNx7bd6tsHA6rusBxNh9SqvoiSGiOz3vTtEEKWaRRZPYJBB7tfe5GyOMGe5Awz3frr3KwptnsUGsYZPYHQoEXk23q1p4sgS6T73hABAHp91rRZmdfTvkpHoaWniWeCxtSYb1dxGoPaDY98qwGy6NQyW5HfwyWHu1b3INDChrRA08VabKH7xs7hmPcJTg23RWpSTkAGyiywp24gTPggYnBOi4IH8vloj16jiZLjJPEwm8L/oy8mDU3GbAc1SjFt0S5yilZzzdnOJhgLuWvom6WwHvPyZeJOn37grzDtYHEUyY6N0kxwtCrmVL2TcVFKwU5SutgL9kspQMmd3FwIYOYbMu7yl8XgqjiCXzGg0DeTQLAclfYszSY7hLSkQUtTZ0uBaW6t8lQSR1XgfzSfONVVbTw5cZg203juiyu9paTwSrA1wiJtPBZl6kMlRQZBv8AFSrlyjWHc/ru4Qm8eyd1tJBFuMqtJvl5308bquTz5wxYrihumySq0OXZuVxXrNjL5H3ZIVbW3HRUjKUUJOokHSTwTWDwuXWM3Lcjso5RJN+e7yW4gdu9OzNoG7QjcNbT3cUAtznTz9+wt6lQmwt71/ygYqt0TDMTFufNMhiG1K2dwY09Vvr9UsXcD5wFo2m4y4gysOBA0B59yYEpOmTuA00TGAbZzhfdpN0kHw2I1VpgzlpSd592TYBRHPy+6yoaI/i8FEgFNptaaYIEx74qna+3DzVy+lNN0k6cdVVMDdDPKI9U0Bii/WdOVvomWRuPYEqyJ4+Sy6Jt6fVMZZ4arcttfdz4gJ2i6TaxGh0KpZiCNyt6LszQ+YOh/wAKWhjZZIh2u4aX4oRppllOwdOvL6lEp05UjSAMoFouJnS8W5+9ydoYa0xPgtWAmxk7k3SZoCe+47N0JM3hGw2HpADfPJMmYWhqCLR3clkVgRv8J81J1xpDj6WWZi1tPqi7JaAQe5bwKlOQJM3ASlOpkJEiDokdUXZ0zbiEfDYnITDQZEX4dyq6FU21vonAkm07QpRTVMbdiQbdGzwP3TWLqhga0MZGUEiNCVW0wSQE5tVjjVPVMCALcAFtGUsWzCUI5pBNm15qNGVomxhoFo0QX18pIys1P4G/ZTAMd0jDBiULHN67u0+qHKWH9iUY+pX0N6uKLm5YETMAAXS8c1pda1ahA5rJtvk3jFR4Etq1NeQVbsh5J3wPJbYk5iRuGp49ilEQCb3EAevcgp8GK0uadBprw9VzmIEOgabvsuke+BBhU1dwDjbXcZjeU4nFr7iJfaRruO9ZyujrG4uB71WOjgSdeBWzhaeHuCrOJs1a/f5KYh/68Pugvq5dNe7wUkkg/eEURZjT3ZU+NrB7xGg4J7G1hdod4z4Koc6875VIRr0pBIBsOS0NURoQeRRBa8TPdr6obL6i3FMRmuZyhptv7ZVuRDQ3hz0VXh6Qc8X0urKrAsT+iTAH0/P1+6iz0fZ4foogQSjBBG4WCoHvhxBNpV1h3X7P8Kp2izLUPM/WE0ME43kaIlMghauGg4rMRH+VQxmjpwA7E7hDALY1vx0Hmk6J6sc9UxmbMgHdew0UsdFzhbWPn/iEzTG4HTSb+qWpVA5ocB4/oj0TOgA3ybm1lDLWwcnfu92R2wBpcd6FngGbwtqbSHHRI2iwYE79Bwgo1FxA6u7z8VimMxO4g3tuiVs1pN54++xIteSwwFaHeoMAJ0NDrtDRxBAuq6lWIGgNpM/Tgtv2mSI7rW8kjqhOkOUahYYmQNxCtsJiw7f9lVMxIdAe0E6SLFONwbXEFtuO7elRqpJlxSfvCZGMqfnPiVTwWWBtzuUbC4kuaCmm1wyXFPlFn+11Pzu8SlqjryTdYLTxSda88tZQ23ywUUuDbEYhoiDPIJHFPJ1sNw3/AKomJcxuok9wVdV2sHSA0yN5gaRvvxSG5JG1GmWm/bBRukGthx3jxSQrQOtN7iNw4XSGNrkxcxFhy3SirM5auwztDGiRHGDPrCQrOzG57LHTtQ6bSRPHisOGs7vC/sqkjinqORG6fUR9FiqyxPDs7O1Qa6Dje4WmKdIvx7fYVIxdCTp7/JR1XK2fqOCMSNYVfjJLjyvyTMxDEVgdbEmd/ruCWdUJ0n1RqhBMQhZcvfpyPFUBhpkfYW8lAYGvcVKbee/h74KV2kA6WQA3s5rdbzxFvJHcCbju4TwWuFEMHjzWzak3996QGmRyysHEDgokI//Z"
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
google_card = Card.create!(world_id: pitch.id, title: "Google Digital Atelier", content: segway_content)
Tagging.create!(tag_id: location_tag2.id, card_id: google_card.id)
Tagging.create!(tag_id: audience_tag.id, card_id: google_card.id)
Tagging.create!(tag_id: support_tag.id, card_id: google_card.id)
Tagging.create!(tag_id: olivia_tag.id, card_id: google_card.id)
Tagging.create!(tag_id: nicola_tag.id, card_id: google_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: google_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: google_card.id)


opening_content = "*insert bold statement here*"
opening_card = Card.create!(world_id: pitch.id, title: "Bold statement", content: opening_content)
Tagging.create!(tag_id: event_tag2.id, card_id: opening_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: opening_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: opening_card.id)


statistic_content = "*insert mind-blowing statistic here*"
statistic_card = Card.create!(world_id: pitch.id, title: "Mind-blowing statistic", content: statistic_content)
Tagging.create!(tag_id: event_tag2.id, card_id: statistic_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: statistic_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: statistic_card.id)


segway_content = "*insert clever segway here*"
segway_card = Card.create!(world_id: pitch.id, title: "Clever segway", content: segway_content)
Tagging.create!(tag_id: event_tag2.id, card_id: segway_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: segway_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: segway_card.id)


painpoint_content = "The painpoint is unstructured notes, lack of acessibility to structuring tools that are scalable and aren't timeconsuming. Really focus on the 'niche' of storytellers-creators like writers/videogame designers/etc., even though the app can be used for a multitude of things."
painpoint_card = Card.create!(world_id: pitch.id, title: "Pain point", content: painpoint_content)
Tagging.create!(tag_id: event_tag2.id, card_id: painpoint_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: painpoint_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: painpoint_card.id)


worldpage_content = ""
worldpage_card = Card.create!(world_id: pitch.id, title: "Display World page", content: worldpage_content)
Tagging.create!(tag_id: event_tag2.id, card_id: worldpage_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: worldpage_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: worldpage_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: worldpage_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: worldpage_card.id)


deleteworld_content = "Destroy all evidence of the Pitcher being a Brony"
deleteworld_card = Card.create!(world_id: pitch.id, title: "Burn a World", content: deletworld_content)
Tagging.create!(tag_id: event_tag2.id, card_id: deleteworld_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: deleteworld_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: deleteworld_card.id)


cardpage_content = ""
cardpage_card = Card.create!(world_id: pitch.id, title: "Display notes", content: cardpage_content)
Tagging.create!(tag_id: event_tag2.id, card_id: cardpage_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: cardpage_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: cardpage_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: cardpage_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: cardpage_card.id)


createcard_content = "Whoopsiedaisy I forgot my assistant"
createcard_card = Card.create!(world_id: pitch.id, title: "Create note", content: createcard_content)
Tagging.create!(tag_id: event_tag2.id, card_id: createcard_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: createcard_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: createcard_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: createcard_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: createcard_card.id)


mappage_content = "I want yooouuu, to show me the waaaay! (everyday)"
mappage_card = Card.create!(world_id: pitch.id, title: "Display map", content: mappage_content)
Tagging.create!(tag_id: event_tag2.id, card_id: mappage_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: mappage_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: mappage_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: mappage_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: mappage_card.id)


placemarker_content = "NAVIGATED B*RITCHES*"
placemarker_card = Card.create!(world_id: pitch.id, title: "Marker", content: placemarker_content)
Tagging.create!(tag_id: event_tag2.id, card_id: placemarker_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: placemarker_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: placemarker_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: placemarker_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: placemarker_card.id)


timeline_content = "Dr. Who would approve"
timeline_card = Card.create!(world_id: pitch.id, title: "Show timeline", content: timeline_content)
Tagging.create!(tag_id: event_tag2.id, card_id: timeline_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: timeline_card.id)
Tagging.create!(tag_id: click_tag.id, card_id: timeline_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: timeline_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: timeline_card.id)


getlost_content = "Ooh no I missed my next train of thought"
getlost_card = Card.create!(world_id: pitch.id, title: "Get lost", content: getlost_content)
Tagging.create!(tag_id: event_tag2.id, card_id: getlost_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: getlost_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: getlost_card.id)


loseit_content = "This is fine."
loseit_card = Card.create!(world_id: pitch.id, title: "NO GOD NOO", content: loseit_content)
Tagging.create!(tag_id: event_tag2.id, card_id: loseit_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: loseit_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: loseit_card.id)


saviour_content = "I saved a life: my own. Am I a hero? I really can't say... but, yes."
saviour_card = Card.create!(world_id: pitch.id, title: "The Rescue", content: saviour_content)
Tagging.create!(tag_id: event_tag2.id, card_id: saviour_card.id)
Tagging.create!(tag_id: corentin_tag.id, card_id: saviour_card.id)
Tagging.create!(tag_id: olivia_tag.id, card_id: saviour_card.id)
Tagging.create!(tag_id: nicola_tag.id, card_id: saviour_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: saviour_card.id)


ending_content = "Cut to black. Audience goes f*udging* apesh*ivers*."
ending_card = Card.create!(world_id: pitch.id, title: "The end", content: ending_content)
Tagging.create!(tag_id: event_tag2.id, card_id: ending_card.id)
Tagging.create!(tag_id: arnaut_tag.id, card_id: ending_card.id)
Tagging.create!(tag_id: speak_tag.id, card_id: ending_card.id)

# TIMELINKS
