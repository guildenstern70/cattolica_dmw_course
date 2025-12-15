-- PostgreSQL DDL for Books and Authors

-- Create Authors table
CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL
);

-- Create Books table
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    num_pages INTEGER NOT NULL CHECK (num_pages > 0),
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- Create indexes for better query performance
CREATE INDEX idx_books_author_id ON Books(author_id);
CREATE INDEX idx_books_isbn ON Books(isbn);
CREATE INDEX idx_authors_surname ON Authors(surname);
