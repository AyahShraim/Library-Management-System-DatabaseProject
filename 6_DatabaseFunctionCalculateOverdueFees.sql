Create or ALTER  Function fn_CalculateOverdueFees (@LoanID INT)
RETURNS INT
AS 
BEGIN
	DECLARE @TotalDays INT
	DECLARE @TotalFees INT
	SELECT  @TotalDays = DATEDIFF(DAY,DueDate,COALESCE(DateReturned,GETDATE()))
	from Loans
	where LoanID = @LoanID
	SET @TotalFees = 
		CASE 
			WHEN @TotalDays < 0 then 0
			WHEN @TotalDays BETWEEN 30 AND 0 then @TotalDays * 1
			ELSE (30 * 1)  + ((@TotalDays - 30) * 2)
		END;
	RETURN @TotalFees
END
GO
/*test the function*/
DECLARE @LoanID INT = 12;
DECLARE @OverdueFees INT;
SET @OverdueFees = dbo.fn_CalculateOverdueFees(@LoanID);
PRINT 'LoanID: ' + CAST(@LoanID AS VARCHAR) + ', OverdueFees: ' + CAST(@OverdueFees AS VARCHAR);

