CREATE OR ALTER PROCEDURE sp_BorrowedBooksReport 
(@StartDate DATE,@EndDate DATE)
AS
Begin 
	SELECT l.BookID,l.DateBorrowed, b.FirstName,b.LastName,b.Email
	FROM Loans AS l
	JOIN Borrowers AS b 
	ON l.BorrowerID=b.BorrowerID
	WHERE l.DateBorrowed BETWEEN  @StartDate AND @EndDate
End ;
GO
/*Testing the procedure*/
EXEC sp_BorrowedBooksReport
    @StartDate = '2023-09-01',
    @EndDate = '2023-10-01'

