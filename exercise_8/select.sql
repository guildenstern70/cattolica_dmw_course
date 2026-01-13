SELECT 
    p.title AS post_title,
    p.content AS post_body,
    p.published_date,
    c.author_name AS commenter,
    c.body AS comment_text,
    c.created_at AS comment_date
FROM Post p
LEFT JOIN Comment c ON p.post_id = c.post_id
WHERE p.post_id = (SELECT min(post_id) FROM Post)
ORDER BY c.created_at ASC;
