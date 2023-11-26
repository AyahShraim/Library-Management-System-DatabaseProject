WITH ActiveBorrowers AS
(
SELECT l.BorrowerID,b.Email, 
Count('*')  as ActiveBorrowingsCount
FROM Loans AS l
JOIN Borrowers AS b
ON l.BorrowerID = b.BorrowerID
AND l.DateReturned IS  NULL 
GROUP BY l.BorrowerID,b.Email
HAVING  COUNT('*') >= 2
)
SELECT * FROM ActiveBorrowers
ORDER BY ActiveBorrowingsCount

