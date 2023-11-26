WITH GroupingAges
AS
(
SELECT 
	BorrowerID,
	DateOfBirth,
CASE
    WHEN (DATEDIFF(YEAR, DateOfBirth, GETDATE())) <= 10 THEN '0-10'
    WHEN (DATEDIFF(YEAR, DateOfBirth, GETDATE())) <= 20 THEN '10-20'
    WHEN (DATEDIFF(YEAR, DateOfBirth, GETDATE())) <= 30 THEN '20-30'
    WHEN (DATEDIFF(YEAR, DateOfBirth, GETDATE())) <= 40 THEN '30-40'
    WHEN (DATEDIFF(YEAR, DateOfBirth, GETDATE())) <= 50 THEN '40-50'
    WHEN (DATEDIFF(YEAR, DateOfBirth, GETDATE())) <= 60 THEN '50-60'
    WHEN (DATEDIFF(YEAR, DateOfBirth, GETDATE())) <= 70 THEN '60-70'
    WHEN (DATEDIFF(YEAR, DateOfBirth, GETDATE())) <= 80 THEN '70-80'
    WHEN (DATEDIFF(YEAR, DateOfBirth, GETDATE())) <= 120 THEN '80+'
	END AS AgeGroup
FROM Borrowers
), 
GenreCount AS
(
SELECT 
	ga.AgeGroup,
	b.Genre,
	COUNT('*') AS GenreCountVal
FROM Loans AS l
JOIN Books AS b ON l.BookID=b.BookID
JOIN GroupingAges AS ga ON l.BorrowerID=ga.BorrowerID
GROUP BY ga.AgeGroup,b.Genre
)
SELECT 
    AgeGroup,
    Genre AS PreferredGenre,
    MAX(GenreCountVal) AS PreferredGenreCount
FROM GenreCount
GROUP BY AgeGroup, Genre
HAVING MAX(GenreCountVal) = (SELECT MAX(GenreCountVal) FROM GenreCount gc WHERE gc.AgeGroup = GenreCount.AgeGroup)
ORDER BY AgeGroup


