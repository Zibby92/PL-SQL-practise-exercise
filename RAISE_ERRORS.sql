
SET SERVEROUTPUT ON;

-- przyk³ad 1: predefiniowane
BEGIN
    RAISE NO_DATA_FOUND;
    RAISE TOO_MANY_ROWS;
    RAISE ZERO_DIVIDE;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('wyst¹pi³ b³¹d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
END;
/


-- przyk³ad 2: niepredefiniowane i u¿ytkownika
DECLARE
    ex_user EXCEPTION;   
    PRAGMA EXCEPTION_INIT(ex_user, -1200);
BEGIN
    RAISE ex_user;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('wyst¹pi³ b³¹d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
END;
/

-- przyk³ad 3: sekcja obslugi bledów
BEGIN
    RAISE NO_DATA_FOUND;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('wyst¹pi³ b³¹d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
        RAISE ZERO_DIVIDE;
END;
/

-- przyk³ad 4
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
            DBMS_OUTPUT.PUT_LINE('wyj¹tek too_many_rows');
    END;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('wyst¹pi³ b³¹d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
END;
/