# Tech-Lib Project

This repository contains the SQL implementation of a Library Management System. The key components and features of the project are as follows:

## Database Design

### 1. Entity Relationship Model (ERM) Diagram
- Entities: **Books**, **Borrowers**, and **Loans**
(![image](https://github.com/AyahShraim/Library-Management-System-DatabaseProject/assets/73714621/052a3b68-a2eb-4e86-b6ba-e95e4c16856e)


### 2. Relational Schema

#### Books
- BookID (PK)
- Title, Author, ISBN, Published Date
- Genre, Shelf Location
- Current Status ('Available' or 'Borrowed')

#### Borrowers
- BorrowerID (PK)
- First Name, Last Name, Email
- Date of Birth, Membership Date

#### Loans
- LoanID (PK)
- BookID (FK), BorrowerID (FK)
- Date Borrowed, Due Date
- Date Returned (NULL if not returned yet)

### 3. Database Seeding

The database is seeded with 1000 books, 1000 borrowers, and 1000 loan records using CSV files but you have to change path for them. You can use BULK INSERT or INSERT statements to seed the database.

- **Books**: Seeding data from 'BooksSeedingData.csv'
- **Borrowers**: Seeding data from 'BorrowersSeedingData.csv'
- **Loans**: Seeding data from 'LoansSeedingData.csv'
  
Or seed directly using **SeedingDataUsingInsert.sql** file

## Queries and Procedures

### 4. Complex Queries and Procedures

1. **List of Borrowed Books**: Retrieve all books borrowed by a specific borrower, including those currently unreturned.

2. **Active Borrowers with CTEs**: Identify borrowers who've borrowed 2 or more books but haven't returned any using CTEs.

3. **Borrowing Frequency using Window Functions**: Rank borrowers based on borrowing frequency.

4. **Popular Genre Analysis using Joins and Window Functions**: Identify the most popular genre for a given month.

5. **Stored Procedure - Add New Borrowers**: Streamline the process of adding a new borrower. Checks if an email exists; if not, adds to **Borrowers**. If existing, returns an error message.

6. **Database Function - Calculate Overdue Fees**: Compute overdue fees for a given loan. Charges fees based on overdue days: $1/day for up to 30 days, $2/day after.

7. **Database Function - Book Borrowing Frequency**: Gauge the borrowing frequency of a book. Counts the number of times the book has been issued.

8. **Overdue Analysis**: List all books overdue by more than 30 days with their associated borrowers.

9. **Author Popularity using Aggregation**: Rank authors by the borrowing frequency of their books.

10. **Genre Preference by Age using Group By and Having**: Determine the preferred genre of different age groups of borrowers.

11. **Stored Procedure - Borrowed Books Report**: Generate a report of books borrowed within a specified date range. Retrieves all books borrowed within the given range, with details like borrower name and borrowing date.

### Trigger Implementation

- Designed a trigger to log an entry into a separate **AuditLog** table whenever a book's status changes from 'Available' to 'Borrowed' or vice versa.

### SQL Stored Procedure with Temp Table

- Designed a stored procedure (**sp_RetrieveHavingOverDueBorrowers**) that retrieves all borrowers who have overdue books. Stores these borrowers in a temporary table, then joins this temp table with the **Loans** table to list out the specific overdue books for each borrower.

### Weekly Peak Days

- Determined the three days in the week with the most share of loans and displayed the result of each day as a percentage of all loans. Sorted the results from the highest percentage to the lowest percentage.

For any questions or further clarifications, please feel free to reach out.
