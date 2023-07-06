require 'faker'

# Create Categories
5.times do
  Category.create!(
    genre: Faker::Book.genre,
    description: Faker::Lorem.sentence(word_count: 6),
    #  age_category: ["Young adult", "Children" ,"Adult", ].sample, inclusion: {
    # in: %w[YoungAdult Children Adult],
    # message: "Age category can only be Young adult, Children or Adult"
#}
  )
end

# Create Users
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password_digest: BCrypt::Password.create("password"),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar_url: Faker::Avatar.image
  )
end

# Create Books
categories = Category.all

50.times do
  book = Book.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Number.between(from: 1, to: 30),
    publication_date: Faker::Date.between(from: '2015-01-01', to: Date.today),
    publisher: Faker::Book.publisher,
    author: Faker::Book.author,
    imageURL: Faker::Internet.url,
    category_id: categories.sample.id
  )
end

# Create Orders
users = User.all
books = Book.all

20.times do
  order = Order.create!(
    quantity: Faker::Number.between(from: 1, to: 5),
    total_price: Faker::Commerce.price(range: 0..30.00),
    user_id: users.sample.id,
    book_id: books.sample.id
  )
end


# Create UserBooks
users = User.all
books = Book.all
orders = Order.all

# 50.times do
#   user_book = UserBook.create!(
#     user_id: users.sample.id,
#     book_id: books.sample.id,
#     order_id: orders.sample.id
#   )
#end

puts "Seed data created successfully"