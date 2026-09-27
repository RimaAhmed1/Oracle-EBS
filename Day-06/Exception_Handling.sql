-- ============================================================
-- PL/SQL Exception Handling --
-- ============================================================

-- Enable DBMS_OUTPUT
SET SERVEROUTPUT ON;


-- ============================================================
-- PART 1: EXCEPTION HANDLING EXAMPLE
-- ============================================================
-- This PL/SQL block accepts an Employee Number from the user
-- and retrieves the employee salary from the EMP table.

DECLARE
    ENO   NUMBER := '&ENO';
    V_SAL NUMBER;

BEGIN

    SELECT SAL
    INTO V_SAL
    FROM EMP
    WHERE EMPNO = ENO;

    DBMS_OUTPUT.PUT_LINE(
        'SAL = ' || V_SAL
    );


-- ============================================================
-- PART 2: HANDLE EXCEPTIONS
-- ============================================================

EXCEPTION

    -- Raised when the SELECT statement returns no record
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'INPUT A VALID EMPNO !!'
        );

    -- Handles any other exception
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'CHECK YOUR PROGRAM !!!'
        );

END;
/


-- ============================================================
-- PART 3: HOW TO RUN
-- ============================================================
--
-- Run the complete PL/SQL block.
--
-- SQL*Plus will ask:
--
-- Enter value for ENO:
--
-- Example with a valid Employee Number:
--
-- Enter value for ENO: 7900
--
-- Expected Output:
-- SAL = 950
--
--
-- To run the previous statement again in SQL*Plus:
--
-- /
--
-- Then enter another Employee Number.


-- ============================================================
-- PART 4: TEST NO_DATA_FOUND
-- ============================================================
--
-- Run the block again:
--
-- /
--
-- Enter an Employee Number that does not exist.
--
-- Example:
--
-- Enter value for ENO: 11123456
--
-- Expected Output:
--
-- INPUT A VALID EMPNO !!


-- ============================================================
-- EXCEPTION TYPES COVERED IN DAY 06
-- ============================================================
--
-- 1. System-Defined Exceptions
--
--    NO_DATA_FOUND
--    TOO_MANY_ROWS
--    ZERO_DIVIDE
--
--
-- 2. User-Defined Exceptions
--
--    Steps:
--
--    DECLARE
--       |
--       v
--    CHECK
--       |
--       v
--    RAISE
--       |
--       v
--    HANDLE
--
-- ============================================================