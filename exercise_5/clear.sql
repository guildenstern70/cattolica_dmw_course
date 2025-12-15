-- PostgreSQL script to drop all tables from exercise_5

-- Drop tables in reverse order of dependencies
DROP TABLE IF EXISTS Exam CASCADE;
DROP TABLE IF EXISTS StudyPlan CASCADE;
DROP TABLE IF EXISTS Student CASCADE;
DROP TABLE IF EXISTS Course CASCADE;
DROP TABLE IF EXISTS Professor CASCADE;
