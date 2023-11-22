DECLARE @BorrowerID INT = 1

SELECT b.bookID,b.Title, l.DateBorrowed,l.DueDate, l.DateReturned
FROM Books AS b
JOIN Loans AS l 
ON b.BookID = l.BookID
WHERE l.BorrowerID = @BorrowerID;


