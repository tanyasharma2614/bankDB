USE bank;
INSERT INTO Customer (Customer_Id, First_Name, Last_Name, Address, Cell_Phone, Email, DOB) Values (1, 'Maharshi', 'Patel', 'NJ', '123-456-7890', 'noreply@gmail.com', '1909-01-01');

INSERT INTO Accounts (Account_Number, Date_Of_Creation, Customer_Id, Account_Balance, Account_Type) Values (101, '2023-10-10', 1, 1000, '0');
INSERT INTO Accounts (Account_Number, Date_Of_Creation, Customer_Id, Account_Balance, Account_Type) Values (102, '2023-10-10', 1, 1000, '2');
INSERT INTO Accounts (Account_Number, Date_Of_Creation, Customer_Id, Account_Balance, Account_Type) Values (103, '2023-10-10', 1, 1000, '0');
INSERT INTO Accounts (Account_Number, Date_Of_Creation, Customer_Id, Account_Balance, Account_Type) Values (104, '2023-10-10', 1, 5000, '2');