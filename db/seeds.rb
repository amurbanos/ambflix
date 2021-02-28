# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    id: 1, 
    level: 1, 
    name: "Admin", 
    email: "admin@ambflix.com", 
    password: "123",
    credit: "value", 
    phone:  "82 888888 8888", 
    status: 1
)
User.create(
    id: 2, 
    level: 2, 
    name: "Vendedor 1", 
    email: "vendedor1@ambflix.com", 
    password: "123",
    credit: "value", 
    phone:  "82 888888 8888", 
    status: 1
)
User.create(
    id: 3, 
    level: 3, 
    name: "Cliente ativo", 
    email: "client@ambflix.com",
    password: "123",
    credit: "value", 
    phone:  "82 888888 8888", 
    status: 1
)
User.create(
    id: 4, 
    level: 3, 
    name: "Cliente desativado", 
    email: "clientedes@ambflix.com", 
    password: "123",
    credit: "value", 
    phone:  "82 888888 8888", 
    status: 0
)
User.create(
    id: 5, 
    level: 2, 
    name: "Vendedor 2", 
    email: "vendedor1@ambflix.com",
    password: "123",
    credit: "value", 
    phone:  "82 888888 8888", 
    status: 1
)

# Add User/Seller location
Location.create(
    latitude: -9.63586323972099,  
    longitude: -35.699680750862484,   
    user_id: 2,     
    course_id: nil
)
Location.create(
    latitude: -9.636175274871551,    
    longitude: -35.69855422312127,   
    user_id: 5,     
    course_id: nil
)