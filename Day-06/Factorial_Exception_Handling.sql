-- Factorial Procedure with Exception Handling --
-- Task:
-- Write a PL/SQL stored procedure that accepts a number
-- and displays the factorial of that number.
-- Handle exceptions.

SET SERVEROUTPUT ON;

-- ============================================
-- 1. CREATE THE PROCEDURE
-- ============================================

CREATE OR REPLACE PROCEDURE RIMA_FACTORIAL
(
    P_NUM IN NUMBER
)
IS
    V_FACTORIAL NUMBER := 1;

    -- User-defined exception
    INVALID_NUMBER EXCEPTION;

BEGIN

    -- Check the input
    IF P_NUM < 0 THEN
        RAISE INVALID_NUMBER;
    END IF;

    -- Calculate factorial
    FOR I IN 1..P_NUM LOOP
        V_FACTORIAL := V_FACTORIAL * I;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        'FACTORIAL OF ' || P_NUM || ' = ' || V_FACTORIAL
    );

EXCEPTION

    WHEN INVALID_NUMBER THEN
        DBMS_OUTPUT.PUT_LINE(
            'PLEASE ENTER A VALID POSITIVE NUMBER.'
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'CHECK YOUR PROGRAM !!!'
        );

END;
/

-- ============================================
-- 2. CHECK FOR COMPILATION ERRORS
-- ============================================

SHOW ERRORS;


-- ============================================
-- 3. EXECUTE THE PROCEDURE
-- ============================================

EXEC RIMA_FACTORIAL(5);


-- Expected Output:
-- FACTORIAL OF 5 = 120


-- ============================================
-- 4. TEST THE USER-DEFINED EXCEPTION
-- ============================================

EXEC RIMA_FACTORIAL(-5);


-- Expected Output:
-- PLEASE ENTER A VALID POSITIVE NUMBER.