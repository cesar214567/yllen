# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(email:"camgcamg11@gmail.com",password:"masterking212",name: "Cesar Antonio",last_name:"Madera Garces",phone_number: "988481388",admin: true)

16.times do |time|
  type = Type.create!(name: "prueba#{time}",description:"prueba#{time}")
  type_image = URI.open("https://cdn.shopify.com/s/files/1/0280/0504/0233/products/image_652517e5-e152-48fb-87f2-09d03b66c4dc_500x.jpg?v=1629609711")
  type.image.attach({io:type_image, filename:'type_image', content_type:'image/png'})
  p time
end

16.times do |time|
  subtype = Subtype.create!(name: "prueba#{time}",description:"prueba#{time}",type_id:(1..15).to_a.sample)
  subtype_image = URI.open("https://cdn.shopify.com/s/files/1/0280/0504/0233/products/image_652517e5-e152-48fb-87f2-09d03b66c4dc_500x.jpg?v=1629609711")
  subtype.image.attach({io:subtype_image, filename:'subtype_image', content_type:'image/png'})
  p time
end

16.times do |time|
  item = Item.create!(name: "prueba#{time}",description:"prueba#{time}",price:10.5,enabled:true,subtype_id:(1..15).to_a.sample,quantity:(1..15).to_a.sample)
  item_image = URI.open("https://cdn.shopify.com/s/files/1/0280/0504/0233/products/image_652517e5-e152-48fb-87f2-09d03b66c4dc_500x.jpg?v=1629609711")
  item_image2 = URI.open("https://cdn.shopify.com/s/files/1/0280/0504/0233/products/image_652517e5-e152-48fb-87f2-09d03b66c4dc_500x.jpg?v=1629609711")
  item.images.attach({io:item_image, filename:'item_image', content_type:'image/png'})
  item.images.attach({io:item_image2, filename:'item_image', content_type:'image/png'})
  p time
end

16.times do |time|
  Reservation.create!(enabled: true, answered: false, item_id: (1..15).to_a.sample, user: user1, quantity: (1..15).to_a.sample)
  p time
end
