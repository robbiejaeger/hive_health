user2 = User.create!(uid: "123456788",
                    first_name: "Jim",
                    last_name: "Smith",
                    email: "jimsmith@example.com")
user3 = User.create!(uid: "123456789",
                     first_name: "Jim",
                     last_name: "Smith",
                     email: "jimsmith@example.com")

site1 = Site.create!(name: "Green Hills Farm",
            description: "Hives for polinating grove trees.",
            street: "1000 Lake Cook Rd",
            city: "Glencoe",
            state: "IL",
            zip: "60022",
            user: user1)
site2 = Site.create!(name: "Ft Collins Hives",
            description: "Hives to help the brews.",
            street: "500 Linden St",
            city: "Fort Collins",
            state: "CO",
            zip: "80524",
            user: user2)
site3 = Site.create!(name: "The Denver Hives",
            description: "Bees that help us code.",
            street: "1510 Blake Street",
            city: "Denver",
            state: "CO",
            zip: "80202",
            user: user2)
site4 = Site.create!(name: "Seattle Site",
            description: "The bees moved here from Portland.",
            street: "410 Terry Ave N",
            city: "Seattle",
            state: "WA",
            zip: "98109",
            user: user1)

hive1 = Hive.create!(name: "Happy Bees",
                     description: "Where happy honey is made.",
                     site: site1)
hive2 = Hive.create!(name: "Bees for the Apple Trees",
                    description: "They serve this entire grove.",
                    site: site2)
hive3 = Hive.create!(name: "Bees for the Cherry Trees",
                     description: "These bees pollinate all of the cherry trees.",
                     site: site2)
hive4 = Hive.create!(name: "Hives at rose garden",
                     description: "This is an experimental hive to help pollinate the rose bushes.",
                     site: site3)

log1 = hive1.logs.create!(notes: "A great day for the bees today!")
log2 = hive1.logs.create!(notes: "All of the frames were completely built up today.")
log3 = hive2.logs.create!(notes: "We had initial trouble with mites, but the mites are not an issue anymore.")
log4 = hive3.logs.create!(notes: "Another great day for the bees today!")
log5 = hive4.logs.create!(notes: "The bees aren't very active today, but weather might be a factor.")
log6 = hive4.logs.create!(notes: "They are finally more active today. Looking great.")
