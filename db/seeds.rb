# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
u = User.create!(
    email: 'bob@bob.com',
    password: 'a',
    password_confirmation: 'a'
)

p1 = Project.create(
    user: u,
    name: 'tree',
    source_code: <<-SRC
     TO tree :size
       if :size < 5 [forward :size back :size stop]
       forward :size/3
       COLOR [255 0 0]
       left 30 tree :size*2/3 right 30
       forward :size/6
       COLOR [0 255 0]
       right 25 tree :size/2 left 25
       forward :size/3
       COLOR [0 0 255]
       right 25 tree :size/2 left 25
       COLOR [100 100 100]
       forward :size/6
       back :size
     END
     clearscreen
     setxy 250 500
     tree 150
SRC
)
p1.recreate_image!
