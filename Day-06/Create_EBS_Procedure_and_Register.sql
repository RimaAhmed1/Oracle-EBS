-- Create and Register a PL/SQL Stored Procedure in Oracle EBS

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

-- Oracle EBS Registration Steps:
--
-- 1. Application Developer Responsibility
-- 2. Concurrent -> Executable
--
--    Name: RIMA_PR_EBS
--    Short Name: RIMA_PR_EBS
--    Execution Method: PL/SQL Stored Procedure
--    Execution File Name: RIMA_PR_EBS
--
-- 3. Concurrent -> Program
--
--    Name: RIMA_PR_EBS
--    Short Name: RIMA_PR_EBS
--    Application: AOL
--    Executable: RIMA_PR_EBS
--    Output Format: HTML
--
-- 4. Add the Concurrent Program to a Request Group.
--
-- 5. Attach the Request Group to the Responsibility.
--
-- 6. Assign the Responsibility to the User.
--
-- 7. Switch to the Responsibility.
--
-- 8. View -> Requests -> Submit a New Request
--
-- 9. Select RIMA_PR_EBS and submit the request.
--
-- 10. Refresh until the request is completed.
--
-- 11. Select View Output to verify the result.