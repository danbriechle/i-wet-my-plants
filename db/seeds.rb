user_1 = User.create!(name: "Bobby",  uid: '3297328fha')
garden = Garden.create!(name: 'Backyard', user: user_1, zip_code: 80401, twitter_handle: 'jpclark63', tweet: false, secret_key: SecureRandom.hex(6))
Plant.create!(name: 'Alice', species: 'Rose', frequency: 12, garden: garden, last_watered: Time.new(2019,02,17,12,19,10))
Plant.create!(name: 'Tom', species: 'Carrot', frequency: 5, garden: garden, last_watered: Time.new(2019,02,17,12,19,10))
Plant.create!(name: 'Elbert', species: 'Beet', frequency: 4, garden: garden, last_watered: Time.new(2019,02,16,12,19,10))

user_2 = User.create!(name: "Guest",  uid: '423145')
garden = Garden.create!(name: 'Backyard Garden', user: user_2, zip_code: 80401, twitter_handle: 'dsfiaon', tweet: false, secret_key: SecureRandom.hex(6))
Plant.create!(name: 'Alice', species: 'Rose', frequency: 12, garden: garden, last_watered: Time.new(2019,02,17,12,19,10))
Plant.create!(name: 'Tom', species: 'Carrot', frequency: 5, garden: garden, last_watered: Time.new(2019,02,17,12,19,10))
Plant.create!(name: 'Elbert', species: 'Beet', frequency: 4, garden: garden, last_watered: Time.new(2019,02,16,12,19,10))