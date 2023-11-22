CREATE OR ALTER PROCEDURE sp_RetrieveHavingOverDueBorrowers
As
Begin 
	CREATE TABLE #TempOverDuesBorrowers (ID INT);
	INSERT INTO #TempOverDuesBorrowers 
	SELECT DISTINCT BorrowerID FROM Loans 
	WHERE  DateReturned  > DueDate OR DateReturned IS NULL;

    SELECT * FROM
	#TempOverDuesBorrowers AS tmp
	JOIN Loans AS l
	ON tmp.ID = l.BorrowerID
	WHERE  l.DateReturned  > l.DueDate OR l.DateReturned IS NULL;
End ;
GO
/*Testing the procedure*/
EXEC sp_RetrieveHavingOverDueBorrowers
 