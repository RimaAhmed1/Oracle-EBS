-- ============================================================
-- Display Current Date in Oracle EBS --
-- ============================================================
-- Create a PL/SQL Stored Procedure that displays the
-- current date when the request is submitted in Oracle EBS.
-- ============================================================

-- ============================================================
-- PART 1: TEST SYSDATE USING DUAL
-- ============================================================

-- DUAL is a special Oracle table that can be used to
-- evaluate expressions and Oracle functions.

DESC DUAL;


-- Display the current database date

SELECT SYSDATE
FROM DUAL;


-- Example:
-- SELECT SYSDATE FROM DUAL;
--
-- Output:
-- 14-SEP-26


-- ============================================================
-- PART 2: CREATE THE ORACLE EBS PROCEDURE
-- ============================================================

CREATE OR REPLACE PROCEDURE RIMA_PR_SYSDT
(
    ERRBUF  OUT VARCHAR2,
    RETCODE OUT NUMBER
)
IS
    V_DT DATE;

BEGIN

    -- Get the current date from the database
    SELECT SYSDATE
    INTO V_DT
    FROM DUAL;


    -- Write information to the Concurrent Request Log
    FND_FILE.PUT_LINE(
        FND_FILE.LOG,
        'YOU CAN SEE LOG DETAILS HERE!'
    );


    -- Write the current date to the Concurrent Request Output
    FND_FILE.PUT_LINE(
        FND_FILE.OUTPUT,
        'CURRENT DATE = ' || V_DT
    );


EXCEPTION

    WHEN OTHERS THEN

        FND_FILE.PUT_LINE(
            FND_FILE.OUTPUT,
            'CHECK YOUR PROGRAM: '
            || ERRBUF
            || ' ERRCODE = '
            || RETCODE
        );

END;
/

SHOW ERRORS;


-- ============================================================
-- PART 3: REGISTER THE PROCEDURE IN ORACLE EBS
-- ============================================================
--
-- Register the procedure using the same Concurrent Program
-- registration flow practiced earlier:
--
-- 1. Create Executable
--
--       Execution Method:
--       PL/SQL Stored Procedure
--
--       Execution File Name:
--       RIMA_PR_SYSDT
--
--
-- 2. Create Concurrent Program
--
--       Attach the executable:
--       RIMA_PR_SYSDT
--
--
-- 3. Add the Concurrent Program to the existing Request Group.
--
--
-- 4. Switch to the required Responsibility.
--
--
-- 5. Submit the Concurrent Request.
--
--
-- 6. Refresh until the request is completed.
--
--
-- 7. View Output.
--
--       Expected result:
--       CURRENT DATE = <current database date>
--
--
-- 8. View Log to see:
--
--       YOU CAN SEE LOG DETAILS HERE!


-- ============================================================
-- COMPLETE FLOW
-- ============================================================
--
-- SELECT SYSDATE FROM DUAL
--             |
--             v
-- Create RIMA_PR_SYSDT
--             |
--             v
-- Register Executable
--             |
--             v
-- Register Concurrent Program
--             |
--             v
-- Add Program to Existing Request Group
--             |
--             v
-- Submit Request
--             |
--             v
-- View Output / View Log
--
-- ============================================================