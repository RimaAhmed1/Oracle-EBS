-- ============================================================
-- Create and Register a PL/SQL Procedure in Oracle EBS --
-- ============================================================


-- ============================================================
-- PART 1: NORMAL DATABASE PROCEDURE
-- ============================================================
-- A normal PL/SQL procedure can display output using
-- DBMS_OUTPUT.PUT_LINE.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE RIMA_PR_TEST
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('WELCOME TO ORACLE DATABASE PROCEDURE!');
END;
/

SHOW ERRORS;


-- Execute the normal database procedure

EXEC RIMA_PR_TEST;


-- Expected Output:
-- WELCOME TO ORACLE DATABASE PROCEDURE!



-- ============================================================
-- PART 2: ORACLE EBS PROCEDURE
-- ============================================================
-- For a PL/SQL Stored Procedure registered as a Concurrent
-- Program in Oracle EBS, the following parameters are required:
--
-- ERRBUF  OUT VARCHAR2
-- RETCODE OUT NUMBER
--
-- FND_FILE.PUT_LINE is used to write output for the
-- Concurrent Request.


CREATE OR REPLACE PROCEDURE RIMA_PR_EBS
(
    ERRBUF  OUT VARCHAR2,
    RETCODE OUT NUMBER
)
IS
BEGIN

    FND_FILE.PUT_LINE(
        FND_FILE.OUTPUT,
        'WELCOME TO ORACLE EBS PROCEDURE!'
    );

END;
/

SHOW ERRORS;


-- ============================================================
-- PART 3: REGISTER THE PROCEDURE IN ORACLE EBS
-- ============================================================

-- Step 1: Switch to the Application Developer Responsibility
--
-- Application Developer
--      |
--      +-- Concurrent
--             |
--             +-- Executable


-- ============================================================
-- Step 2: Create the Executable
-- ============================================================
--
-- Name              : RIMA_PR_EBS
-- Short Name        : RIMA_PR_EBS
-- Execution Method  : PL/SQL Stored Procedure
-- Execution File Name: RIMA_PR_EBS
--
-- Save the record.


-- ============================================================
-- Step 3: Create the Concurrent Program
-- ============================================================
--
-- Application Developer
--      |
--      +-- Concurrent
--             |
--             +-- Program
--
-- Name        : RIMA_PR_EBS
-- Short Name  : RIMA_PR_EBS
-- Application : AOL
-- Executable  : RIMA_PR_EBS
-- Output      : HTML
--
-- Save the record.


-- ============================================================
-- Step 4: Add the Program to a Request Group
-- ============================================================
--
-- Switch to:
-- System Administrator Responsibility
--
-- Navigation:
-- Security -> Responsibility -> Request
--
-- Add the Concurrent Program to the required Request Group.
--
-- Program: RIMA_PR_EBS
--
-- Save the changes.


-- ============================================================
-- Step 5: Attach the Request Group to a Responsibility
-- ============================================================
--
-- System Administrator
--      |
--      +-- Security
--             |
--             +-- Responsibility
--                    |
--                    +-- Define
--
-- Attach the Request Group to the required Responsibility.
--
-- Save the changes.


-- ============================================================
-- Step 6: Assign the Responsibility to a User
-- ============================================================
--
-- Assign the Responsibility to the required Oracle EBS user.


-- ============================================================
-- PART 4: EXECUTE THE PROCEDURE IN ORACLE EBS
-- ============================================================
--
-- 1. Switch to the Responsibility.
--
-- 2. Navigate to:
--
--       View -> Requests
--
-- 3. Select:
--
--       Submit a New Request
--
-- 4. Choose:
--
--       Single Request
--
-- 5. Select the Concurrent Program:
--
--       RIMA_PR_EBS
--
-- 6. Click Submit.
--
-- 7. Refresh the request status.
--
--       Pending
--          |
--          v
--       Running
--          |
--          v
--       Completed
--
-- 8. Click:
--
--       View Output
--
-- Expected Output:
--
--       WELCOME TO ORACLE EBS PROCEDURE!


-- ============================================================
-- COMPLETE FLOW
-- ============================================================
--
-- Create PL/SQL Procedure in Database
--              |
--              v
-- Create Executable in Oracle EBS
--              |
--              v
-- Create Concurrent Program
--              |
--              v
-- Add Program to Request Group
--              |
--              v
-- Attach Request Group to Responsibility
--              |
--              v
-- Assign Responsibility to User
--              |
--              v
-- Submit Concurrent Request
--              |
--              v
-- View Output
--
-- ============================================================