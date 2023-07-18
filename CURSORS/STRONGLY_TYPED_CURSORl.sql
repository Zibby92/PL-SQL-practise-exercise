SET SERVEROUTPUT ON;
--  strongly typed cursor
DECLARE
CURSOR curr RETURN employees%ROWTYPE is 
    (SELECT * FROM employees);
BEGIN
FOR i IN curr
    LOOP 
    DBMS_OUTPUT.PUT_LINE(i.first_name);
    END LOOP;
END;