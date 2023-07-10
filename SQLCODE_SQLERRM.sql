
SET SERVEROUTPUT ON;

-- przyk?d 1 sqlcode
BEGIN
    DBMS_OUTPUT.PUT_LINE(sqlcode);
END;
/

-- przyk?d 2 sqlcode
DECLARE
    v_liczba number := sqlcode;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_liczba);
END;
/

-- przyk?d 3 sqlcode
DECLARE
    ex_user EXCEPTION;   
BEGIN
    RAISE ex_user;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(sqlcode);
END;
/

-- przyk?d 4 sqlcode
DECLARE
    ex_user EXCEPTION;   
    PRAGMA EXCEPTION_INIT(ex_user, -1200);
BEGIN
    RAISE ex_user;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(sqlcode);
END;
/

-- przyk?d 1 sqlerrm
BEGIN
    DBMS_OUTPUT.PUT_LINE(sqlerrm);
END;
/

-- przyk?d 2 sqlerrm
DECLARE
    v_tekst varchar2(200) := sqlerrm;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_tekst);
END;
/

-- przyk?d 3 sqlerrm
DECLARE
    ex_user EXCEPTION;   
--    PRAGMA EXCEPTION_INIT(ex_user, -1200);
BEGIN
    RAISE ex_user;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(sqlerrm);
END;
/

-- przyk?d 4 sqlerrm
BEGIN
    DBMS_OUTPUT.PUT_LINE(sqlerrm(-2005));
END;
/

-- przyk?d praktyczny
DECLARE
    v_emp_id employees.employee_id%TYPE;
BEGIN
    SELECT employee_id
      INTO v_emp_id
      FROM employees
     WHERE last_name = 'XXX'
    ;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wykryto b?d, kod:'||SQLCODE||', komunikat: '||SQLERRM);
END;
/


5_10.sql
Wyœwietlam 5_10.sql.