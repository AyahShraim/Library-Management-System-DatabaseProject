WITH AuthorPopularity AS
(
SELECT b.Author,
Count(l.LOANID) AS BooksBorrowingFrequency,
DENSE_RANK() OVER( ORDER BY  Count(l.LOANID) DESC ) AS AuthorPopbularityRank
FROM  Books AS b 
LEFT JOIN  Loans AS l
ON b.BookID =l.BookID 
GROUP BY b.Author
)
SELECT *
FROM AuthorPopularity



