-- PostgreSQL script to drop all tables from exercise_6

-- Drop tables in reverse order of dependencies
DROP TABLE IF EXISTS Author CASCADE;
DROP TABLE IF EXISTS Post CASCADE;
DROP TABLE IF EXISTS Comment CASCADE;
