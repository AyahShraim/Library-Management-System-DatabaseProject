CREATE TABLE Books
(
BookID INT PRIMARY KEY IDENTITY,
Title varchar(255) NOT NULL,
Author varchar(255) NOT NULL,
ISBN varchar(13) NOT NULL,
PublishedDate date NOT NULL,
Genre varchar(50) NOT NULL,
ShelfLocation varchar(20) NOT NULL,
CurrentStatus varchar(10) NOT NULL,
CONSTRAINT CHK_CurrentStatus_Books CHECK (CurrentStatus IN ('Borrowed','Available')),
);

CREATE TABLE Borrowers
(
BorrowerID INT PRIMARY KEY IDENTITY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Email varchar(255) NOT NULL UNIQUE,
DateOfBirth date NOT NULL,
MembershipDate date NOT NULL,
);

CREATE TABLE Loans
(
LoanID INT PRIMARY KEY IDENTITY,
BookID INT ,
BorrowerID INT,
DateBorrowed DATE NOT NULL,
DueDate Date NOT NULL,
DateReturned  Date,
CONSTRAINT FK_Loans_Books FOREIGN KEY (BookID) REFERENCES Books (BookID),
CONSTRAINT FK_Loans_Borrowers FOREIGN KEY (BorrowerID) REFERENCES Borrowers (BorrowerID)
);
GO
CREATE  TRIGGER trg_UpdateBookStatus
ON Loans
AFTER INSERT,UPDATE 
AS
BEGIN
UPDATE b SET CurrentStatus =
	CASE
		WHEN EXISTS (SELECT '*' FROM Loans AS l WHERE l.BookID = b.BookID AND l.DateReturned IS NULL) 
			THEN 'Borrowed'
		Else 
			'Available'
	END
	FROM Books AS b
	WHERE EXISTS(SELECT '*' FROM inserted as i WHERE i.BookID = b.BookID)
END 
Go