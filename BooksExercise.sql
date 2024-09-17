--BYU OIT Technical Exercises

--1. Write the SQL that displays the total number of books published by each publisher.
SELECT 
	p.publisher_name
	,COUNT(b.book_id) [Books Published]
FROM publisher p
LEFT JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_name

--2. Write the SQL that displays the books that have more than one author.
SELECT
	b.title as [Multi Authored Book]
FROM book AS b
INNER JOIN book_author ba ON b.book_id = ba.book_id
GROUP BY ba.book_id, b.title
HAVING COUNT(*) > 1

--3. Write the SQL that displays a list of authors that have not written any award-winning books.
SELECT
	auth.author_id AS [Unawarded Author ID]
	,auth.first_name
	,auth.last_name
FROM author auth
LEFT JOIN book_author b_auth ON auth.author_id = b_auth.author_id
LEFT JOIN book b ON b_auth.book_id = b.book_id
LEFT JOIN book_award b_awrd ON b.book_id = b_awrd.book_id
LEFT JOIN award awrd ON b_awrd.award_id = awrd.award_id
GROUP BY auth.author_id, auth.first_name, auth.last_name
HAVING COUNT(awrd.award_id) = 0
