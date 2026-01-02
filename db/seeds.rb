# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create Genres
genres = [
  { name: "Romance", description: "Stories about love and relationships" },
  { name: "Fantasy", description: "Magical worlds and adventures" },
  { name: "Science Fiction", description: "Future technology and space" },
  { name: "Mystery", description: "Suspenseful detective stories" },
  { name: "Thriller", description: "Edge-of-your-seat excitement" },
  { name: "Horror", description: "Scary and supernatural tales" },
  { name: "Young Adult", description: "Stories for teen readers" },
  { name: "Poetry", description: "Poems and verse" },
  { name: "Fan Fiction", description: "Stories based on existing works" },
  { name: "Adventure", description: "Action-packed journeys" },
  { name: "Historical", description: "Stories set in the past" },
  { name: "Humor", description: "Funny and lighthearted stories" }
]

puts "Creating genres..."
genres.each do |genre_data|
  Genre.find_or_create_by!(name: genre_data[:name]) do |genre|
    genre.description = genre_data[:description]
    genre.slug = genre_data[:name].parameterize
  end
end
puts "Created #{Genre.count} genres"

# Create Admin User
puts "Creating admin user..."
admin = User.create!(
  email: "admin@example.com",
  password: "password123",
  password_confirmation: "password123"
)
admin.add_role(:admin)
admin.profile.update!(
  pen_name: "Admin User",
  bio: "Platform administrator and moderator"
)
puts "Admin created: admin@example.com / password123"

# Create Sample Authors
puts "Creating sample authors..."
5.times do |i|
  user = User.create!(
    email: "author#{i + 1}@example.com",
    password: "password123",
    password_confirmation: "password123"
  )
  user.add_role(:author)
  user.profile.update!(
    pen_name: Faker::Name.name,
    bio: Faker::Lorem.paragraph(sentence_count: 3),
    location: "#{Faker::Address.city}, #{Faker::Address.country}"
  )
end
puts "Created #{User.with_role(:author).count} authors"

# Create Sample Readers
puts "Creating sample readers..."
10.times do |i|
  user = User.create!(
    email: "reader#{i + 1}@example.com",
    password: "password123",
    password_confirmation: "password123"
  )
  user.profile.update!(
    pen_name: Faker::Name.name,
    bio: Faker::Lorem.sentence
  )
end
puts "Created readers"

# Create Sample Stories
puts "Creating sample stories..."
User.with_role(:author).each do |author|
  rand(2..4).times do
    story = author.stories.create!(
      title: Faker::Book.title,
      description: Faker::Lorem.paragraph(sentence_count: 5),
      status: [:published, :completed].sample
    )

    # Assign random genres
    story.genres << Genre.all.sample(rand(1..3))

    # Create chapters
    rand(3..8).times do |j|
      story.chapters.create!(
        title: "Chapter #{j + 1}: #{Faker::Lorem.words(number: 3).join(' ').titleize}",
        content: Faker::Lorem.paragraphs(number: 15).join("\n\n"),
        position: j + 1,
        published_at: Time.current - rand(1..30).days
      )
    end

    # Publish the story
    story.update(published_at: Time.current - rand(1..60).days)

    # Add some random views and likes
    story.update(
      views_count: rand(100..5000),
      likes_count: rand(10..500)
    )
  end
end
puts "Created #{Story.count} stories with chapters"

# Create Sample Interactions
puts "Creating sample interactions..."
User.all.each do |user|
  # Like random stories
  Story.published_stories.sample(rand(3..10)).each do |story|
    user.like(story)
  end

  # Favorite random stories
  Story.published_stories.sample(rand(1..5)).each do |story|
    user.favorite(story)
  end

  # Follow random users
  User.where.not(id: user.id).sample(rand(1..5)).each do |other_user|
    user.follow(other_user)
  end

  # Add comments
  Story.published_stories.sample(rand(1..3)).each do |story|
    story.comments.create!(
      user: user,
      content: Faker::Lorem.paragraph(sentence_count: 2)
    )
  end
end
puts "Created interactions"

puts "\n✅ Seed data created successfully!"
puts "\nSample Login Credentials:"
puts "Admin: admin@example.com / password123"
puts "Authors: author1@example.com through author5@example.com / password123"
puts "Readers: reader1@example.com through reader10@example.com / password123"