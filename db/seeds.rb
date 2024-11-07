# Seed Users
User.create(name: 'Admin User', email: 'admin@example.com', password: 'password', role: 'admin')
User.create(name: 'Regular User', email: 'user@example.com', password: 'password', role: 'regular')

# Seed Books
Book.create(title: 'To Kill a Mockingbird', author: 'Harper Lee', description: 'A novel about the serious issues of rape and racial inequality.', cover_image: 'https://covers.openlibrary.org/b/id/8224956-L.jpg')
Book.create(title: '1984', author: 'George Orwell', description: 'A dystopian social science fiction novel and cautionary tale about the future.', cover_image: 'https://covers.openlibrary.org/b/id/7222246-L.jpg')
Book.create(title: 'Moby Dick', author: 'Herman Melville', description: 'A sailor’s account of the obsessive quest of Ahab for revenge against Moby Dick.', cover_image: 'https://covers.openlibrary.org/b/id/5472479-L.jpg')
Book.create(title: 'Pride and Prejudice', author: 'Jane Austen', description: 'A romantic novel that also critiques the social expectations of the time.', cover_image: 'https://covers.openlibrary.org/b/id/8582672-L.jpg')
Book.create(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', description: 'A story about the disillusionment with the American Dream in the 1920s.', cover_image: 'https://covers.openlibrary.org/b/id/8227561-L.jpg')
Book.create(title: 'War and Peace', author: 'Leo Tolstoy', description: 'A historical novel that focuses on the Napoleonic wars and the impact on Russian society.', cover_image: 'https://covers.openlibrary.org/b/id/9442599-L.jpg')
Book.create(title: 'The Catcher in the Rye', author: 'J.D. Salinger', description: 'A novel about a young man grappling with his life and identity.', cover_image: 'https://covers.openlibrary.org/b/id/7886079-L.jpg')
Book.create(title: 'The Odyssey', author: 'Homer', description: 'An ancient Greek epic poem about the adventures of Odysseus.', cover_image: 'https://covers.openlibrary.org/b/id/8424301-L.jpg')
Book.create(title: 'The Lord of the Rings', author: 'J.R.R. Tolkien', description: 'An epic high-fantasy story of adventure and the battle between good and evil.', cover_image: 'https://covers.openlibrary.org/b/id/10035285-L.jpg')
Book.create(title: 'Brave New World', author: 'Aldous Huxley', description: 'A dystopian novel that critiques the rise of a highly controlled society.', cover_image: 'https://covers.openlibrary.org/b/id/8224721-L.jpg')
Book.create(title: 'Crime and Punishment', author: 'Fyodor Dostoevsky', description: 'A psychological drama about a young man who commits a murder and struggles with guilt.', cover_image: 'https://covers.openlibrary.org/b/id/7855035-L.jpg')
Book.create(title: 'The Hobbit', author: 'J.R.R. Tolkien', description: 'A fantasy novel about Bilbo Baggins, a hobbit who goes on a grand adventure.', cover_image: 'https://covers.openlibrary.org/b/id/9779382-L.jpg')
Book.create(title: 'Les Misérables', author: 'Victor Hugo', description: 'A historical novel set during the French Revolution, centered on the life of Jean Valjean.', cover_image: 'https://covers.openlibrary.org/b/id/9320130-L.jpg')
Book.create(title: 'The Alchemist', author: 'Paulo Coelho', description: 'A philosophical novel about pursuing one’s dreams and personal legend.', cover_image: 'https://covers.openlibrary.org/b/id/10604785-L.jpg')
Book.create(title: 'The Picture of Dorian Gray', author: 'Oscar Wilde', description: 'A novel that explores themes of beauty, morality, and corruption.', cover_image: 'https://covers.openlibrary.org/b/id/7830406-L.jpg')
Book.create(title: 'Frankenstein', author: 'Mary Shelley', description: 'A gothic novel about the consequences of creating life without considering its implications.', cover_image: 'https://covers.openlibrary.org/b/id/8367217-L.jpg')
Book.create(title: 'The Scarlet Letter', author: 'Nathaniel Hawthorne', description: 'A novel about the effects of sin and guilt in Puritan New England.', cover_image: 'https://covers.openlibrary.org/b/id/6927989-L.jpg')
Book.create(title: 'Dracula', author: 'Bram Stoker', description: 'A gothic horror novel about Count Dracula’s attempt to move from Transylvania to England in order to spread the undead curse.', cover_image: 'https://covers.openlibrary.org/b/id/7482182-L.jpg')
Book.create(title: 'The Sun Also Rises', author: 'Ernest Hemingway', description: 'A novel that captures the disillusionment and aimlessness of the Lost Generation.', cover_image: 'https://covers.openlibrary.org/b/id/6155277-L.jpg')
Book.create(title: 'Animal Farm', author: 'George Orwell', description: 'A political allegory about the Russian Revolution using farm animals as the main characters.', cover_image: 'https://covers.openlibrary.org/b/id/8003062-L.jpg')

# Seed Book Clubs
book_club = BookClub.create(name: 'Book Club 1', description: 'A great book club', user: User.first)

# Seed Memberships
Membership.create(user: User.last, book_club: book_club)

# Seed Discussions
Discussion.create(content: 'This is a discussion about the book "1984".', user: User.first, book_club: book_club)
Discussion.create(content: 'This is a discussion about the book "Moby Dick".', user: User.last, book_club: book_club)

# Seed Events
Event.create(title: 'Book Club Meetup', description: 'Join us for an online discussion on the latest book.', book_club: book_club, start_time: DateTime.now + 7.days)
