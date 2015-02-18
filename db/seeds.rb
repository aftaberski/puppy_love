# USERS
anna = User.create(name: "Anna", password: "anna")
missy = User.create(name: "Missy", password: "missy")

# ARTICLES
article = Article.create(title:"Sleepy Puppy", photo: "http://bit.ly/LTGDG3", content: "Puppies get sleepy too", user_id: anna.id)

Article.create(title:"Puppies <3 Kittens", photo: "http://bit.ly/1FsDciM", content: "Cuddles for dayz", user_id: missy.id)

Article.create(title:"High Five!", photo: "http://bit.ly/1DqqqQU", content: "Right on.", user_id: anna.id)

Article.create(title:"Just Hangin'", photo: "http://bit.ly/1ASmZkf", content: "Casual hangouts", user_id: anna.id)
