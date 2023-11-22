DECLARE @month INT = 11;
WITH GenresCount AS
(
SELECT
	b.Title,
	b.Genre,
	Month(l.DateBorrowed) as BorrowingMonth,
	COUNT('*') OVER( partition by Month(l.DateBorrowed),b.Genre) AS BorrowingsCount
FROM
Loans AS l 
JOIN Books AS b
ON l.BookID = b.BookID
WHERE Month(l.DateBorrowed) = @month
)
SELECT DISTINCT TOP 1  WITH TIES
	BorrowingMonth,
	BorrowingsCount,
	Genre
FROM GenresCount
ORDER BY BorrowingsCount DESC

