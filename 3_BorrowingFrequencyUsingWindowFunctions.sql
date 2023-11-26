SELECT l.BorrowerID, b.FirstName, b.LastName,
COUNT(l.BorrowerID) AS BorrowingFrequency,
DENSE_RANK() OVER( ORDER BY COUNT(l.BorrowerID) DESC) AS RankBorrowingFrequency 
FROM
Loans AS l
JOIN Borrowers as b
ON l.BorrowerID = b.BorrowerID
GROUP BY l.BorrowerID, b.FirstName, b.LastName