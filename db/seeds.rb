
#Delete all flowers in db
Flower.destroy_all

# Since I couldn't find flower in Faker gem
# Flower db table population via seed data
Flower.create!(name: "Daisy", description: "spring flower")
      .image.attach(io: File.open('app/assets/images/daisy-flower.jpeg'), filename: 'daisy-flower.jpeg')
Flower.create!(name: "Flax", description: "winter flower")
      .image.attach(io: File.open('app/assets/images/flax-flower.jpeg'), filename: 'flax-flower.jpeg')
Flower.create!(name: "Impatiens Balsamina", description: "spring flower")
      .image.attach(io: File.open('app/assets/images/Impatiens_balsamina.jpeg'), filename: 'Impatiens_balsamina.jpeg')
Flower.create!(name: "Jasmine", description: "autumn flower")
      .image.attach(io: File.open('app/assets/images/Jasmine_Flower.jpeg'), filename: 'Jasmine_Flower.jpeg')
Flower.create!(name: "Lavender", description: "summer flower")
      .image.attach(io: File.open('app/assets/images/Lavender.jpg'), filename: 'Lavender.jpg')
Flower.create!(name: "Lotus", description: "spring flower")
      .image.attach(io: File.open('app/assets/images/lotus.jpeg'), filename: 'lotus.jpeg')
Flower.create!(name: "Magnolia", description: "winter flower")
      .image.attach(io: File.open('app/assets/images/Magnolia.jpeg'), filename: 'Magnolia.jpeg')
Flower.create!(name: "Redrose", description: "autumn flower")
      .image.attach(io: File.open('app/assets/images/redrose.jpeg'), filename: 'redrose.jpeg')
Flower.create!(name: "Sunflower", description: "summer flower")
      .image.attach(io: File.open('app/assets/images/sunflower.jpeg'), filename: 'sunflower.jpeg')
Flower.create!(name: "Tulip", description: "spring flower")
      .image.attach(io: File.open('app/assets/images/tulip-flower.png'), filename: 'tulip-flower.png')


