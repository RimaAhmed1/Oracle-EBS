/*
CREATE PROCEDURE AND FUNCTION USING SQL*PLUS

Objective:
Create, compile, and execute a PL/SQL Procedure and Function
using SQL*Plus.
*/

SET SERVEROUTPUT ON;

-- ==================================================
-- PROCEDURE
-- ==================================================

CREATE OR REPLACE PROCEDURE RIMA_PR_TEST
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('WELCOME TO ORACLE PROCEDURE');
END;
/

-- Check compilation errors
SHOW ERRORS;

-- Execute the Procedure
EXEC RIMA_PR_TEST;


-- ==================================================
-- FUNCTION
-- ==================================================

CREATE OR REPLACE FUNCTION RIMA_FN_TEST
RETURN VARCHAR2
IS
    V_MSG VARCHAR2(200);
BEGIN
    V_MSG := 'WELCOME TO ORACLE FUNCTION';

    RETURN V_MSG;
END;
/

-- Check compilation errors
SHOW ERRORS;

-- Execute the Function
SELECT RIMA_FN_TEST
FROM DUAL;


/*
EXPECTED OUTPUT

Procedure:
WELCOME TO ORACLE PROCEDURE

Function:
WELCOME TO ORACLE FUNCTION
*/

/*
--------------------------------------------------
EVIDENCE
--------------------------------------------------

Screenshot:
procedure_function_sqlplus.PNG

The screenshot shows the successful execution of the PL/SQL
Procedure and Function using SQL*Plus.
*/