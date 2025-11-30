PRAGMA foreign_keys = ON;

-- Drop in dependency order
DROP TABLE IF EXISTS borrows;
DROP TABLE IF EXISTS book_copies;
DROP TABLE IF EXISTS book_genres;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS publishers;
DROP TABLE IF EXISTS members;

-- ===============
-- CORE ENTITIES
-- ===============

CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT
);

CREATE TABLE publishers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    founded_year INTEGER
);

CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    published_year INTEGER,
    author_id INTEGER NOT NULL,
    publisher_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);

-- A book can have multiple physical copies
CREATE TABLE book_copies (
    id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL,
    copy_number INTEGER NOT NULL,
    condition TEXT DEFAULT 'Good',
    FOREIGN KEY (book_id) REFERENCES books(id),
    UNIQUE(book_id, copy_number)
);

-- ===============
-- GENRE SYSTEM
-- ===============

CREATE TABLE genres (
    id INTEGER PRIMARY KEY,
    genre_name TEXT NOT NULL UNIQUE
);

-- Many-to-many book ↔ genres
CREATE TABLE book_genres (
    id INTEGER PRIMARY KEY,
    book_id INTEGER,
    genre_id INTEGER,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- ===============
-- MEMBERS & BORROWS
-- ===============

CREATE TABLE members (
    id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    join_date TEXT NOT NULL  -- YYYY-MM-DD
);

CREATE TABLE borrows (
    id INTEGER PRIMARY KEY,
    copy_id INTEGER,
    member_id INTEGER,
    borrow_date TEXT NOT NULL,
    return_date TEXT,
    FOREIGN KEY (copy_id) REFERENCES book_copies(id),
    FOREIGN KEY (member_id) REFERENCES members(id)
);

-- =====================
-- SEED SAMPLE DATA
-- =====================

-- AUTHORS (20)
INSERT INTO authors (id, name, country) VALUES
(1,  'J.K. Rowling',                'United Kingdom'),
(2,  'George R.R. Martin',          'United States'),
(3,  'Haruki Murakami',             'Japan'),
(4,  'Chimamanda Ngozi Adichie',    'Nigeria'),
(5,  'Neil Gaiman',                 'United Kingdom'),
(6,  'Isabel Allende',              'Chile'),
(7,  'Brandon Sanderson',           'United States'),
(8,  'Stephen King',                'United States'),
(9,  'Margaret Atwood',             'Canada'),
(10, 'Toni Morrison',               'United States'),
(11, 'Gabriel García Márquez',      'Colombia'),
(12, 'Kazuo Ishiguro',              'United Kingdom'),
(13, 'Ursula K. Le Guin',           'United States'),
(14, 'Philip Pullman',              'United Kingdom'),
(15, 'Rick Riordan',                'United States'),
(16, 'Sally Rooney',                'Ireland'),
(17, 'Colson Whitehead',            'United States'),
(18, 'Liu Cixin',                   'China'),
(19, 'N.K. Jemisin',                'United States'),
(20, 'Unknown Author',              'Unknown');  -- has no books

-- PUBLISHERS (12)
INSERT INTO publishers (id, name, founded_year) VALUES
(1,  'Penguin Random House',   1927),
(2,  'HarperCollins',          1989),
(3,  'Bloomsbury Publishing',  1986),
(4,  'Hachette Book Group',    1992),
(5,  'Macmillan Publishers',   1843),
(6,  'Simon & Schuster',       1924),
(7,  'Scholastic',             1920),
(8,  'Tor Books',              1980),
(9,  'Orbit Books',            1974),
(10, 'Faber & Faber',          1929),
(11, 'Vintage Books',          1954),
(12, 'New Directions',         1936);

-- BOOKS (30)
INSERT INTO books (id, title, published_year, author_id, publisher_id) VALUES
(1,  'Harry Potter and the Philosopher''s Stone', 1997, 1, 3),
(2,  'Harry Potter and the Chamber of Secrets',   1998, 1, 3),
(3,  'A Game of Thrones',                         1996, 2, 1),
(4,  'A Clash of Kings',                          1998, 2, 1),
(5,  'Norwegian Wood',                            1987, 3, 1),
(6,  'Kafka on the Shore',                        2002, 3, 10),
(7,  'Americanah',                                2013, 4, 2),
(8,  'Half of a Yellow Sun',                      2006, 4, 2),
(9,  'Neverwhere',                                1996, 5, 1),
(10, 'The Ocean at the End of the Lane',          2013, 5, 1),
(11, 'City of the Beasts',                        2002, 6, 1),
(12, 'The House of the Spirits',                  1982, 6, 11),
(13, 'Mistborn: The Final Empire',                2006, 7, 8),
(14, 'The Way of Kings',                          2010, 7, 8),
(15, 'The Shining',                               1977, 8, 5),
(16, 'It',                                        1986, 8, 5),
(17, 'The Handmaid''s Tale',                      1985, 9, 6),
(18, 'Beloved',                                   1987, 10, 6),
(19, 'One Hundred Years of Solitude',             1967, 11, 5),
(20, 'Never Let Me Go',                           2005, 12, 10),
(21, 'A Wizard of Earthsea',                      1968, 13, 12),
(22, 'His Dark Materials: Northern Lights',       1995, 14, 7),
(23, 'The Lightning Thief',                       2005, 15, 7),
(24, 'Normal People',                             2018, 16, 10),
(25, 'The Underground Railroad',                  2016, 17, 11),
(26, 'The Three-Body Problem',                    2006, 18, 9),
(27, 'The Fifth Season',                          2015, 19, 9),
(28, 'The Unborrowed Book',                       2020, 5, 2),   -- rarely used
(29, 'Silent Library Nights',                     2022, 19, 2),
(30, 'Mystery of the Lost Archive',               2023, 19, 4);

-- GENRES (18)
INSERT INTO genres (id, genre_name) VALUES
(1,  'Fantasy'),
(2,  'Science Fiction'),
(3,  'Drama'),
(4,  'Young Adult'),
(5,  'Adventure'),
(6,  'Mystery'),
(7,  'Horror'),
(8,  'Literary Fiction'),
(9,  'Historical Fiction'),
(10, 'Magical Realism'),
(11, 'Dystopian'),
(12, 'Romance'),
(13, 'Coming-of-age'),
(14, 'Thriller'),
(15, 'Epic'),
(16, 'Humour'),
(17, 'Non-fiction'),
(18, 'Short Stories');

-- BOOK_GENRES (40+ rows, many-to-many)
INSERT INTO book_genres (id, book_id, genre_id) VALUES
(1,  1, 1),
(2,  1, 4),
(3,  2, 1),
(4,  2, 4),
(5,  3, 1),
(6,  3, 15),
(7,  4, 1),
(8,  4, 15),
(9,  5, 8),
(10, 5, 13),
(11, 6, 8),
(12, 6, 10),
(13, 7, 8),
(14, 7, 3),
(15, 8, 9),
(16, 9, 1),
(17, 9, 6),
(18, 10, 1),
(19, 10, 10),
(20, 11, 5),
(21, 11, 13),
(22, 12, 8),
(23, 12, 10),
(24, 13, 1),
(25, 13, 5),
(26, 14, 1),
(27, 14, 15),
(28, 15, 7),
(29, 15, 14),
(30, 16, 7),
(31, 17, 11),
(32, 17, 8),
(33, 18, 8),
(34, 18, 3),
(35, 19, 10),
(36, 19, 9),
(37, 20, 8),
(38, 21, 1),
(39, 21, 5),
(40, 22, 1),
(41, 22, 4),
(42, 23, 1),
(43, 23, 4),
(44, 24, 8),
(45, 24, 12),
(46, 25, 8),
(47, 26, 2),
(48, 26, 15),
(49, 27, 2),
(50, 27, 1),
(51, 28, 8),
(52, 29, 6),
(53, 29, 14),
(54, 30, 6),
(55, 30, 14);

-- BOOK_COPIES (40 copies across 30 books)
INSERT INTO book_copies (id, book_id, copy_number, condition) VALUES
(1,  1,  1, 'Good'),
(2,  1,  2, 'Fair'),
(3,  1,  3, 'Good'),
(4,  2,  1, 'Good'),
(5,  2,  2, 'Excellent'),
(6,  3,  1, 'Good'),
(7,  3,  2, 'Worn'),
(8,  4,  1, 'Good'),
(9,  5,  1, 'Good'),
(10, 6,  1, 'Good'),
(11, 7,  1, 'Excellent'),
(12, 8,  1, 'Good'),
(13, 9,  1, 'Good'),
(14, 10, 1, 'Good'),
(15, 11, 1, 'Fair'),
(16, 12, 1, 'Good'),
(17, 13, 1, 'Good'),
(18, 14, 1, 'Good'),
(19, 15, 1, 'Good'),
(20, 16, 1, 'Fair'),
(21, 17, 1, 'Good'),
(22, 18, 1, 'Good'),
(23, 19, 1, 'Good'),
(24, 20, 1, 'Good'),
(25, 21, 1, 'Good'),
(26, 22, 1, 'Good'),
(27, 23, 1, 'Good'),
(28, 24, 1, 'Good'),
(29, 25, 1, 'Good'),
(30, 26, 1, 'Good'),
(31, 27, 1, 'Good'),
(32, 28, 1, 'Good'),
(33, 29, 1, 'Good'),
(34, 30, 1, 'Good'),
(35, 5,  2, 'Worn'),
(36, 10, 2, 'Good'),
(37, 15, 2, 'Good'),
(38, 20, 2, 'Excellent'),
(39, 25, 2, 'Good'),
(40, 30, 2, 'Good');

-- MEMBERS (25)
INSERT INTO members (id, full_name, join_date) VALUES
(1,  'Alice Johnson',        '2024-01-10'),
(2,  'Bob Smith',            '2024-02-15'),
(3,  'Charlie Lee',          '2024-03-01'),
(4,  'Dana Kim',             '2024-03-15'),
(5,  'Eva Müller',           '2024-04-05'),
(6,  'Farid Khan',           '2024-04-20'),
(7,  'Grace Li',             '2024-05-01'),
(8,  'Hassan Ali',           '2024-05-10'),
(9,  'Irene Novak',          '2024-05-18'),
(10, 'Jack Thompson',        '2024-06-01'),
(11, 'Klara Schmidt',        '2024-06-12'),
(12, 'Luis Fernandez',       '2024-06-25'),
(13, 'Maria Rossi',          '2024-07-05'),
(14, 'Noah Williams',        '2024-07-20'),
(15, 'Olivia Brown',         '2024-08-01'),
(16, 'Pedro Silva',          '2024-08-12'),
(17, 'Qi Zhang',             '2024-08-25'),
(18, 'Rania Hassan',         '2024-09-01'),
(19, 'Sara Johansson',       '2024-09-10'),
(20, 'Tomáš Novák',          '2024-09-18'),
(21, 'Uma Patel',            '2024-10-01'),
(22, 'Victor Hugo',          '2024-10-10'),
(23, 'Wang Wei',             '2024-10-20'),
(24, 'Yuki Tanaka',          '2024-11-01'),
(25, 'Zoe Martin',           '2024-11-10');

-- BORROWS (40; mix of returned / not returned, some copies never borrowed)
INSERT INTO borrows (id, copy_id, member_id, borrow_date, return_date) VALUES
(1,  1,  1,  '2025-01-05', '2025-01-15'),
(2,  2,  2,  '2025-01-10', '2025-01-25'),
(3,  3,  3,  '2025-01-20', NULL),
(4,  4,  4,  '2025-01-22', '2025-02-05'),
(5,  5,  5,  '2025-01-25', NULL),
(6,  6,  6,  '2025-02-01', '2025-02-14'),
(7,  8,  7,  '2025-02-05', NULL),
(8,  9,  8,  '2025-02-10', '2025-02-20'),
(9,  10, 9,  '2025-02-15', NULL),
(10, 11, 10, '2025-02-18', '2025-03-01'),
(11, 12, 11, '2025-02-20', NULL),
(12, 13, 12, '2025-02-22', '2025-03-05'),
(13, 14, 13, '2025-02-25', NULL),
(14, 15, 14, '2025-03-01', '2025-03-12'),
(15, 16, 15, '2025-03-03', NULL),
(16, 17, 16, '2025-03-05', '2025-03-18'),
(17, 18, 17, '2025-03-07', NULL),
(18, 20, 18, '2025-03-10', NULL),
(19, 21, 19, '2025-03-12', '2025-03-25'),
(20, 22, 20, '2025-03-15', NULL),
(21, 23, 21, '2025-03-18', '2025-03-30'),
(22, 24, 22, '2025-03-20', NULL),
(23, 25, 23, '2025-03-22', '2025-04-05'),
(24, 26, 24, '2025-03-25', NULL),
(25, 27, 25, '2025-03-28', NULL),
(26, 28, 1,  '2025-04-01', '2025-04-12'),
(27, 29, 2,  '2025-04-03', NULL),
(28, 31, 3,  '2025-04-05', '2025-04-20'),
(29, 32, 4,  '2025-04-07', NULL),
(30, 33, 5,  '2025-04-10', NULL),
(31, 34, 6,  '2025-04-12', '2025-04-25'),
(32, 35, 7,  '2025-04-15', NULL),
(33, 36, 8,  '2025-04-18', NULL),
(34, 37, 9,  '2025-04-20', '2025-05-02'),
(35, 38, 10, '2025-04-22', NULL),
(36, 39, 11, '2025-04-25', '2025-05-08'),
(37, 1,  12, '2025-05-01', NULL),   -- same copy borrowed again later
(38, 4,  13, '2025-05-03', NULL),
(39, 6,  14, '2025-05-05', NULL),
(40, 22, 15, '2025-05-07', NULL);
