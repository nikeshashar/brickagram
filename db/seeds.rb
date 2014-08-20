# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' } { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel' city: cities.first)

Post.destroy_all

1.upto(10) do |n|
	puts "Adding image #{n}"
	tags = %w(#lego #csharpd #nikesh #master #builder #emmet #skittles #tastethelego).sample(2).join(', ')
	image = %w(lego.jpg LEGO_Logo.jpg lego_skittles.jpg).sample
	Post.create(title: "Awesome Post #{n}", tags_list: tags, picture: File.new(Rails.root.join 'spec/images/' + image))
end