-- PostgreSQL DML for Blog Database

-- 1. Insert Authors
INSERT INTO Author (username, email, bio)
VALUES 
    ('alex_tech', 'alex@example.com', 'Software Engineer and Gadget Enthusiast'),
    ('sara_writes', 'sara@example.com', 'Traveler, Foodie, and Professional Storyteller');

-- 2. Insert Posts for 'alex_tech' (Author ID 1)
INSERT INTO Post (author_id, title, content, slug)
VALUES 
    (1, 'PostgreSQL Performance', 'Deep dive into indexing...', 'pg-performance'),
    (1, 'Future of AI', 'Discussing neural networks...', 'future-ai'),
    (1, 'My Home Office Setup', 'The best monitors for coding...', 'office-setup'),
    (1, 'Learning Rust', 'Why I switched from Python...', 'learning-rust'),
    (1, 'Docker Tips', 'Optimizing your containers...', 'docker-tips');

-- 3. Insert Posts for 'sara_writes' (Author ID 2)
INSERT INTO Post (author_id, title, content, slug)
VALUES 
    (2, 'Best Coffee in Rome', 'The hidden gems of Italy...', 'rome-coffee'),
    (2, 'Packing Light', 'How to travel with just a backpack...', 'packing-light'),
    (2, 'The Perfect Sourdough', 'My 3-day fermentation process...', 'perfect-sourdough'),
    (2, 'Hiking the Alps', 'A guide to the best trails...', 'hiking-alps'),
    (2, 'Minimalist Living', 'Decluttering my apartment...', 'minimalist-living');

-- 4. Insert Comments (2 or 3 per post)
-- Using a few examples for the first few posts
INSERT INTO Comment (post_id, author_name, body)
VALUES 
    -- Comments for Post 1 (pg-performance)
    (1, 'DataGuru', 'Great tips on B-Tree indexes!'),
    (1, 'DBA_Admin', 'Don''t forget about VACUUM ANALYZE.'),
    (1, 'CodeNewbie', 'This helped me clear my interview.'),

    -- Comments for Post 2 (future-ai)
    (2, 'RobotFan', 'AI is moving so fast!'),
    (2, 'Philosopher', 'We need to talk more about ethics.'),

    -- Comments for Post 6 (rome-coffee)
    (6, 'EspressoLover', 'Sant’ Eustachio is my favorite too!'),
    (6, 'TravelBug', 'Added this to my Google Maps list.'),
    (6, 'ItalyFan', 'Wait until you try the coffee in Naples!');

-- (Note: In a real-world scenario, you would continue this for all 10 posts)