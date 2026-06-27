-- ==========================================================
-- Exercise 3 : Stored Procedures
-- ==========================================================

-- ==========================================================
-- STEP 1: Create Tables
-- ==========================================================

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    AccountType VARCHAR2(20),
    Balance NUMBER(10,2)
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(100),
    Department VARCHAR2(50),
    Salary NUMBER(10,2)
);

-- ==========================================================
-- STEP 2: Insert Sample Data
-- ==========================================================

INSERT INTO Accounts VALUES (101,'Janu','Savings',10000);
INSERT INTO Accounts VALUES (102,'Priya','Savings',15000);
INSERT INTO Accounts VALUES (103,'Ravi','Current',8000);
INSERT INTO Accounts VALUES (104,'Vinay','Savings',20000);

INSERT INTO Employees VALUES (1,'James','HR',50000);
INSERT INTO Employees VALUES (2,'Sophia','IT',70000);
INSERT INTO Employees VALUES (3,'William','IT',65000);
INSERT INTO Employees VALUES (4,'Emma','Finance',60000);

COMMIT;

-- ==========================================================
-- View Initial Data
-- ==========================================================

SELECT * FROM Accounts;
SELECT * FROM Employees;

-- ==========================================================
-- Scenario 1
-- ProcessMonthlyInterest
-- Apply 1% interest to all Savings Accounts
-- ==========================================================

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN

    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;

END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/

-- Verify Scenario 1

SELECT * FROM Accounts;

-- ==========================================================
-- Scenario 2
-- UpdateEmployeeBonus
-- Increase Salary using Bonus Percentage
-- ==========================================================

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus
(
    p_department IN VARCHAR2,
    p_bonus IN NUMBER
)
AS
BEGIN

    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus / 100)
    WHERE Department = p_department;

    COMMIT;

END;
/

-- Execute Procedure
-- Example: Give 10% bonus to IT Department

BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/

-- Verify Scenario 2

SELECT * FROM Employees;

-- ==========================================================
-- Scenario 3
-- TransferFunds
-- Transfer Amount Between Accounts
-- ==========================================================

CREATE OR REPLACE PROCEDURE TransferFunds
(
    p_fromAccount IN NUMBER,
    p_toAccount IN NUMBER,
    p_amount IN NUMBER
)
AS

    v_balance NUMBER;

BEGIN

    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_fromAccount;

    IF v_balance >= p_amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_fromAccount;

        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_toAccount;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;

END;
/

-- Execute Procedure
-- Example: Transfer 2000 from Account 101 to Account 103

BEGIN
    TransferFunds(101,103,2000);
END;
/

-- Verify Scenario 3

SELECT * FROM Accounts;

-- ==========================================================
-- Final Verification
-- ==========================================================

SELECT * FROM Accounts;

SELECT * FROM Employees;