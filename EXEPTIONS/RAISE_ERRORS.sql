
SET SERVEROUTPUT ON;

-- przyk�ad 1: predefiniowane
BEGIN
    RAISE NO_DATA_FOUND;
    RAISE TOO_MANY_ROWS;
    RAISE ZERO_DIVIDE;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('wyst�pi� b��d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
END;
/


-- przyk�ad 2: niepredefiniowane i u�ytkownika
DECLARE
    ex_user EXCEPTION;   
    PRAGMA EXCEPTION_INIT(ex_user, -1200);
BEGIN
    RAISE ex_user;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('wyst�pi� b��d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
END;
/

-- przyk�ad 3: sekcja obslugi bled�w
BEGIN
    RAISE NO_DATA_FOUND;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('wyst�pi� b��d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
        RAISE ZERO_DIVIDE;
END;
/

-- przyk�ad 4
BEGIN
    DECLARE
        v_emp_id employees.employee_id%TYPE;
    BEGIN
        SELECT employee_id
          INTO v_emp_id
          FROM employees
		;
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('wyj�tek too_many_rows');
    END;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('wyst�pi� b��d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
END;
/