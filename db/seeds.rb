user_1 = User.create!(name: "Bobby",  uid: '3297328fha')
garden = Garden.create!(name: 'Backyard', user: user_1, zip_code: 84928)
Plant.create!(name: 'Alice', species: 'Rose', frequency: 24, garden: garden)
Plant.create!(name: 'Tom', species: 'Carrot', frequency: 12, garden: garden)
Plant.create!(name: 'Elbert', species: 'Beet', frequency: 18, garden: garden)