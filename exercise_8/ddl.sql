-- PostgreSQL DDL for Blog Database

-- 1. Create the Author table
CREATE TABLE Author (
    author_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    bio TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create the Post table
CREATE TABLE Post (
    post_id SERIAL PRIMARY KEY,
    author_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    published_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    slug VARCHAR(100) UNIQUE NOT NULL,
    -- Links Post to Author
    CONSTRAINT fk_author
        FOREIGN KEY(author_id) 
        REFERENCES Author(author_id)
        ON DELETE CASCADE
);

-- 3. Create the Comment table
CREATE TABLE Comment (
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL,
    author_name VARCHAR(100) NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Links Comment to Post
    CONSTRAINT fk_post
        FOREIGN KEY(post_id) 
        REFERENCES Post(post_id)
        ON DELETE CASCADE
);

-- Create indexes for performance on foreign keys
CREATE INDEX idx_post_author ON Post(author_id);
CREATE INDEX idx_comment_post ON Comment(post_id);