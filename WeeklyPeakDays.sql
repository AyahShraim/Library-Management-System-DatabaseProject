WITH BorrowedDay
AS
(
SELECT 
	*,
	DATENAME(WEEKDAY,DateBorrowed) as BorrowedDay
FROM Loans
)
SELECT TOP 3
	BorrowedDay, 
	Count(*) AS countdays,
	(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS LoansPercentage
FROM BorrowedDay
GROUP BY BorrowedDay
ORDER BY LoansPercentage DESC
Go