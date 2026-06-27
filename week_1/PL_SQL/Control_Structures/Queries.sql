-- ============================================
-- Exercise 1: Control Structures
-- ============================================

-- Create Tables

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    IsVIP CHAR(1) DEFAULT 'N'
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER,
    DueDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ============================================
-- Insert Sample Data
-- ============================================

INSERT INTO Customers VALUES (1, 'John Smith', DATE '1955-06-15', 15000, 'N');
INSERT INTO Customers VALUES (2, 'Alice Brown', DATE '1990-04-20', 8000, 'N');
INSERT INTO Customers VALUES (3, 'Robert Davis', DATE '1960-01-10', 12000, 'N');

INSERT INTO Loans VALUES (101, 1, 10, SYSDATE + 15);
INSERT INTO Loans VALUES (102, 2, 12, SYSDATE + 40);
INSERT INTO Loans VALUES (103, 3, 9, SYSDATE + 20);

COMMIT;

-- ============================================
-- Scenario 1
-- Apply 1% discount for customers above 60
-- ============================================

BEGIN
    FOR cust IN (
        SELECT CustomerID, DOB
        FROM Customers
    ) LOOP

        IF FLOOR(MONTHS_BETWEEN(SYSDATE, cust.DOB)/12) > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = cust.CustomerID;
        END IF;

    END LOOP;

    COMMIT;
END;
/

SELECT * FROM Loans;

-- ============================================
-- Scenario 2
-- Promote VIP Customers
-- ============================================

BEGIN
    FOR cust IN (
        SELECT CustomerID, Balance
        FROM Customers
    ) LOOP

        IF cust.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'Y'
            WHERE CustomerID = cust.CustomerID;
        END IF;

    END LOOP;

    COMMIT;
END;
/

SELECT * FROM Customers;

-- ============================================
-- Scenario 3
-- Loan Reminder
-- ============================================

BEGIN
    FOR loan IN (
        SELECT c.Name,
               l.LoanID,
               l.DueDate
        FROM Customers c
        JOIN Loans l
          ON c.CustomerID = l.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear ' || loan.Name ||
            ', Loan ID ' || loan.LoanID ||
            ' is due on ' ||
            TO_CHAR(loan.DueDate, 'DD-MON-YYYY')
        );

    END LOOP;
END;
/

SELECT * FROM Customers;
SELECT * FROM Loans;

