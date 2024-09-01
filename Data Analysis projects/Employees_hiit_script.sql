-- Create Employees table
CREATE TABLE Employees_Hiit (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Gender NVARCHAR(10), 
    Department NVARCHAR(50),
    Position NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert 10 rows into Employees table
INSERT INTO Employees_Hiit (EmployeeID, FirstName, LastName, Gender, Department, Position, Salary)
VALUES
    (1, 'John', 'Doe', 'Male', 'Sales', 'Sales Manager', 75000.00),
    (2, 'Jane', 'Smith', 'Female', 'HR', 'HR Manager', 80000.00),
    (3, 'Michael', 'Johnson', 'Male', 'IT', 'Software Engineer', 60000.00),
    (4, 'Emily', 'Williams', 'Female', 'IT', 'IT Specialist', 55000.00),
    (5, 'David', 'Brown', 'Male', 'Finance', 'Financial Analyst', 65000.00),
    (6, 'Sarah', 'Miller', 'Female', 'IT', 'Database Administrator', 70000.00),
    (7, 'Samantha', 'Anderson', 'Female', 'Sales', 'Sales Representative', 50000.00),
    (8, 'Linda', 'Martinez', 'Female', 'HR', 'HR Coordinator', 45000.00),
    (9, 'Daniel', 'Taylor', 'Male', 'Marketing', 'Marketing Manager', 72000.00),
    (10, 'Olivia', 'Davis', 'Female', 'Finance', 'Finance Manager', 90000.00),
	(11, 'Viola', 'Kean', 'Female', 'Finance', 'Finance Manager II', 90000.00 );
