DROP PROCEDURE IF EXISTS sp_AddNewBorrower;
GO
CREATE PROCEDURE sp_AddNewBorrower 
(
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Email VARCHAR(255),
@DateOfBirth DATE,
@MembershipDate Date,
@ReturnedMsg VARCHAR(50) output
)
As
Begin 
IF EXISTS (Select '*' from Borrowers where Email = @Email)
	BEGIN
		SET @ReturnedMsg = 'error: already exist email'
	END
ELSE
	BEGIN
		INSERT INTO Borrowers Values (@FirstName,@LastName,@Email,@DateOfBirth,@MembershipDate);
		SET @ReturnedMsg = 'borrower added successfully with id ' + CONVERT(VARCHAR, SCOPE_IDENTITY());
	END
End ;
GO
/*Testing the procedure*/
DECLARE @ReturnedMsg VARCHAR(50);
EXEC sp_AddNewBorrower
    @FirstName = 'person',
    @LastName = 'family',
    @Email = 'personfamily@example.com',
    @DateOfBirth = '2000-08-01',
    @MembershipDate = '2023-01-01',
    @ReturnedMsg = @ReturnedMsg OUTPUT;
PRINT @ReturnedMsg; 
