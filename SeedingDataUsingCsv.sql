/* change the path of csv files or use the other file name SeedingDataUsingInsert */

BULK INSERT Borrowers
FROM 'C:\Users\DELL\Documents\SQL Server Management Studio\LibraryManagementDataBase\Data\BorrowersSeedingData.csv'
WITH (FORMAT='CSV', FIELDTERMINATOR=',', FIRSTROW = 2);

BULK INSERT Books
FROM 'C:\Users\DELL\Documents\SQL Server Management Studio\LibraryManagementDataBase\Data\BooksSeedingData.csv'
WITH (FORMAT='CSV', FIELDTERMINATOR=',', FIRSTROW = 2);

BULK INSERT Loans
FROM 'C:\Users\DELL\Documents\SQL Server Management Studio\LibraryManagementDataBase\Data\LoansSeedingData.csv'
WITH (FORMAT='CSV', FIELDTERMINATOR=',', FIRSTROW = 2);




