-- ============================================================
--- Create Parameterized Oracle Report ---
-- ============================================================

-- Purpose:
-- Create an Oracle Report that accepts a Department Number
-- as a parameter and displays employees from that department.


-- ============================================================
-- 1. Report Query
-- ============================================================

SELECT *
FROM EMP
WHERE DEPTNO = :DNO;


-- ============================================================
-- 2. Bind Parameter
-- ============================================================

-- :DNO is a bind parameter.
-- The value is provided by the user when submitting the report.
--
-- Example:
-- DNO = 10
--
-- The report will display employees whose DEPTNO = 10.


-- ============================================================
-- 3. Create the Report in Oracle Reports Builder
-- ============================================================

-- Open Oracle Reports Builder.
-- Create a new report using the Report Wizard.
--
-- Use the query:
--
-- SELECT *
-- FROM EMP
-- WHERE DEPTNO = :DNO;
--
-- Select the required report style.
-- Complete the wizard and generate the report.
-- Save the report as an RDF file.


-- ============================================================
-- 4. Create Value Set in Oracle EBS
-- ============================================================

-- Navigate to:
-- Application Developer
--   -> Application
--   -> Validation
--   -> Set
--
-- Create a Value Set for the Department Number parameter.
--
-- The Value Set controls/validates the value entered for DNO.


-- ============================================================
-- 5. Register Executable
-- ============================================================

-- Navigate to:
-- Concurrent
--   -> Program
--   -> Executable
--
-- Execution Method:
-- Oracle Reports
--
-- Execution File Name:
-- Enter the RDF file name without the .rdf extension.


-- ============================================================
-- 6. Register Concurrent Program
-- ============================================================

-- Navigate to:
-- Concurrent
--   -> Program
--   -> Define
--
-- Attach the registered executable to the Concurrent Program.


-- ============================================================
-- 7. Define Parameter
-- ============================================================

-- Add the Department Number parameter.
--
-- Value Set:
-- Attach the Department Number Value Set.
--
-- Token:
-- DNO
--
-- The token must correspond to the bind parameter used
-- in the Oracle Report query:
--
-- :DNO


-- ============================================================
-- 8. Add to Request Group
-- ============================================================

-- Add the Concurrent Program to the required Request Group
-- so that it becomes available from the responsibility.


-- ============================================================
-- 9. Submit the Report
-- ============================================================

-- Navigate to:
-- View
--   -> Requests
--   -> Submit a New Request
--
-- Select the registered Concurrent Program.
-- Enter a Department Number.
--
-- Example:
-- DNO = 10
--
-- Submit the request and verify the output.


-- ============================================================
-- Flow
-- ============================================================

-- User enters Department Number
--          |
--          v
--     Value Set
--          |
--          v
--       DNO Token
--          |
--          v
--   Bind Parameter :DNO
--          |
--          v
--     Oracle Report
--          |
--          v
-- SELECT * FROM EMP
-- WHERE DEPTNO = :DNO