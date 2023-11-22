WITH OverDues
AS
(
SELECT *,
DATEDIFF(DAY, DueDate,COALESCE(DateReturned,GETDATE())) AS OverDueDays
FROM Loans 
)
SELECT b.BorrowerID,b.FirstName,b.LastName,b.Email,o.bookID,o.OverDueDays,o.DateBorrowed,o.DueDate,o.DateReturned
FROM Borrowers AS b JOIN OverDues AS  o
ON b.BorrowerID = o.BorrowerID
WHERE o.OverDueDays > 30

