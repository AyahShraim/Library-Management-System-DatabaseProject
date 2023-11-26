IF NOT EXISTS (
    SELECT * FROM sys.tables t 
    JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
    WHERE s.name = 'dbo' AND t.name = 'AuditLog') 
    CREATE TABLE AuditLog (
        LogID INT PRIMARY KEY IDENTITY(1,1),
        BookID INT,
        StatusChangeTo VARCHAR(50),
		ChangeDate DATETIME
    );
GO
CREATE OR ALTER TRIGGER trg_LogBooksStatusChanges
ON Books
AFTER UPDATE 
AS
BEGIN
    INSERT INTO AuditLog (BookID, StatusChangeTo, ChangeDate)
    SELECT 
        BookID,
        CASE
			WHEN  CurrentStatus  = 'Available' THEN 'Available'
		    WHEN  CurrentStatus  = 'Borrowed' THEN 'Borrowed'

        END AS StatusChange,
        GETDATE() AS ChangeDate
    FROM inserted
    WHERE EXISTS (SELECT 1 FROM deleted WHERE deleted.BookID = inserted.BookID AND deleted.CurrentStatus != inserted.CurrentStatus);
END;

/*
////test the trigger SET DateReturned to NULL or to GETDATE() 
UPDATE Loans
SET DateReturned = NULL where BookID =32;
select * from Loans where BookID =32;
select * from books where bookid= 32;
select * from AuditLog;
*/