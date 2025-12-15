-- PostgreSQL DML for Blog Database

-- Insert Authors
INSERT INTO Author (name, surname, email, bio) VALUES
('Marco', 'Rossi', 'marco.rossi@example.com', 'Technical writer and developer.'),
('Laura', 'Bianchi', 'laura.bianchi@example.com', 'Lifestyle and travel blogger.');

-- Insert Posts (3 posts)
INSERT INTO Post (author_id, title, slug, content, status, published_at) VALUES
(1, 'Introducing Our New Project', 'introducing-our-new-project', 'This is the content of the first post. It presents our new project and goals.', 'published', now() - INTERVAL '10 days'),
(1, 'Deep Dive: Architecture', 'deep-dive-architecture', 'A technical deep dive into the architecture used for the project.', 'published', now() - INTERVAL '7 days'),
(2, 'Travel Tips for 2025', 'travel-tips-2025', 'Practical travel tips and packing checklists for 2025 trips.', 'published', now() - INTERVAL '3 days');

-- Insert Comments (2 comments per post)
INSERT INTO Comment (post_id, author_name, author_email, content, created_at, is_approved) VALUES
-- Comments for Post 1
(1, 'Giovanni', 'giovanni@example.com', 'Great introduction! Looking forward to updates.', now() - INTERVAL '9 days', TRUE),
(1, 'Anna', 'anna@example.com', 'Nice overview — can you share more about timeline?', now() - INTERVAL '8 days', TRUE),
-- Comments for Post 2
(2, 'Paolo', 'paolo@example.com', 'Excellent technical explanation.', now() - INTERVAL '6 days', TRUE),
(2, 'Sara', 'sara@example.com', 'Could you provide a sample repo link?', now() - INTERVAL '5 days', FALSE),
-- Comments for Post 3
(3, 'Luca', 'luca@example.com', 'These tips are very useful, thanks!', now() - INTERVAL '2 days', TRUE),
(3, 'Chiara', 'chiara@example.com', 'Would love more details on budget travel.', now() - INTERVAL '1 day', FALSE);


-- SELECT first post with its comments
SELECT
  p.post_id,
  p.title AS post_title,
  p.slug AS post_slug,
  p.content AS post_content,
  p.published_at,
  a.name  AS author_name,
  a.surname AS author_surname,
  c.comment_id,
  c.author_name AS comment_author,
  c.author_email AS comment_email,
  c.content AS comment_content,
  c.created_at AS comment_created_at,
  c.is_approved
FROM Post p
LEFT JOIN Author a ON p.author_id = a.author_id
LEFT JOIN Comment c ON p.post_id = c.post_id
WHERE p.post_id = 1
ORDER BY c.created_at;