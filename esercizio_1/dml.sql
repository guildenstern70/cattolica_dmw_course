-- PostgreSQL DML for Books and Authors

-- Insert Authors
INSERT INTO Authors (name, surname, birthdate) VALUES
('George', 'Orwell', '1903-06-25'),
('Jane', 'Austen', '1775-12-16'),
('Gabriel', 'García Márquez', '1927-03-06'),
('Haruki', 'Murakami', '1949-01-12'),
('Virginia', 'Woolf', '1882-01-25'),
('Franz', 'Kafka', '1883-07-03'),
('Toni', 'Morrison', '1931-02-18'),
('Fyodor', 'Dostoevsky', '1821-11-11');

-- Insert Books
INSERT INTO Books (title, isbn, num_pages, author_id) VALUES
('1984', '9780451524935', 328, 1),
('Animal Farm', '9780451526342', 112, 1),
('Pride and Prejudice', '9780141439518', 432, 2),
('One Hundred Years of Solitude', '9780060883287', 417, 3),
('Kafka on the Shore', '9781400079278', 505, 4),
('Norwegian Wood', '9780375704024', 296, 4),
('Mrs Dalloway', '9780156628709', 194, 5),
('The Metamorphosis', '9780553213690', 201, 6),
('Beloved', '9781400033416', 324, 7),
('Crime and Punishment', '9780143058144', 671, 8);
