-- PostgreSQL DDL for a simple Blog website
-- Tables: Author, Post, Comment

-- Create Author table
CREATE TABLE Author (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    bio TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Create Post table
CREATE TABLE Post (
    post_id SERIAL PRIMARY KEY,
    author_id INTEGER,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    content TEXT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'draft', -- e.g. draft, published
    published_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    CONSTRAINT chk_title_nonempty CHECK (char_length(title) > 0),
    FOREIGN KEY (author_id) REFERENCES Author(author_id) ON DELETE SET NULL
);

-- Create Comment table
CREATE TABLE Comment (
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL,
    author_name VARCHAR(200) NOT NULL,
    author_email VARCHAR(255),
    content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    is_approved BOOLEAN DEFAULT FALSE,
    parent_comment_id INTEGER,
    FOREIGN KEY (post_id) REFERENCES Post(post_id) ON DELETE CASCADE,
    FOREIGN KEY (parent_comment_id) REFERENCES Comment(comment_id) ON DELETE CASCADE
);

-- Indexes for common queries
CREATE INDEX idx_post_author ON Post(author_id);
CREATE INDEX idx_post_status ON Post(status);
CREATE INDEX idx_post_published_at ON Post(published_at);
CREATE INDEX idx_comment_post ON Comment(post_id);
CREATE INDEX idx_comment_parent ON Comment(parent_comment_id);

-- Optional: simplified view for published posts (helpful for queries)
CREATE VIEW PublishedPosts AS
SELECT p.post_id, p.title, p.slug, p.published_at, a.author_id, a.name, a.surname
FROM Post p
LEFT JOIN Author a ON p.author_id = a.author_id
WHERE p.status = 'published';

-- Notes:
-- - `Author` stores blog authors. Deleting an author sets `Post.author_id` to NULL so posts remain available.
-- - `Post` stores posts with a unique `slug` for friendly URLs.
-- - `Comment` references `Post` and supports nested comments via `parent_comment_id`.
-- - Use transactions and proper application-level validation when inserting/updating (e.g., ensure slug uniqueness, sanitize HTML in content/comments).
