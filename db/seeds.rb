# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tolkien_titles = ["Silmarillion", "The Lord of the Rings: The Fellowship of the Ring", "The Hobbit or There and Back Again"]
jordan_titles = ["The Wheel of Time: The Eye of the World", "The Strike at Shayol Ghul", "Conan the Barbarian"]

tolkien_titles.each do |title|
  Book.create(title: title, author: "J.R.R. Tolkien")
end

jordan_titles.each do |title|
  Book.create(title: title, author: "Robert Jordan")
end

Book.create(title: "JavaScript for kids", author: "Nicki Morgan")
Book.create(title: "Eating People is Wrong", author: "Malcolm Bradbury")
Book.create(title: "Do Not Open This Book", author: "Andy Lee")