-- by default: clustered index on primary keys + email field in borrowers table as it's unique
CREATE INDEX IX_Loans_BookID
ON Loans (BookID);

CREATE INDEX IX_Loans_BorrowerID
ON Loans (BorrowerID);

CREATE INDEX IX_Loans_BorrowerID_DateReturned
ON Loans (BorrowerID, DateReturned);

CREATE INDEX IX_Loans_DueDate
ON Loans (DueDate);

CREATE INDEX IX_Loans_DateReturned
ON Loans (DateReturned);

CREATE INDEX IX_Loans_DateBorrowed
ON Loans (DateBorrowed);

CREATE INDEX IX_Books_Genre
ON Books (Genre);	

CREATE INDEX IX_Books_CurrentStatus
ON Books (CurrentStatus);	

