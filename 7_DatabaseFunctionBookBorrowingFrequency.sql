CREATE OR ALTER Function fn_BookBorrowingFrequency (@BookID INT)
RETURNS INT
AS 
BEGIN
	DECLARE @BorrowingCount INT
	SELECT  @BorrowingCount = COUNT('*')
	from Loans
	where BookID = @BookID
	RETURN @BorrowingCount
END
GO
DECLARE @BookID INT = 1000;
DECLARE @BorrowingCount INT ;
SET @BorrowingCount = dbo.fn_BookBorrowingFrequency(@BookID);
PRINT 'Borrowing Count for book with id  ' + CAST(@BookID AS VARCHAR) + ' = ' + CAST(@BorrowingCount AS VARCHAR);
