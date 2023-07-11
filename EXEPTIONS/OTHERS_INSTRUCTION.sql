
SET SERVEROUTPUT ON;

-- przyk?ad 1
DECLARE
    v_emp_id employees.employee_id%TYPE;
BEGIN
    SELECT employee_id
      INTO v_emp_id
      FROM employees
    --WHERE last_name = 'XXX'
    ;
EXCEPTION
    WHEN NO_DATA_FOUND OR TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Twój komunikat');
END;
/

-- przyk?ad 2
DECLARE
    v_emp_id employees.employee_id%TYPE;
BEGIN
    SELECT employee_id
      INTO v_emp_id
      FROM employees
     WHERE last_name = 'XXX'
    ;
EXCEPTION
    WHEN NO_DATA_FOUND OR TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Twój komunikat 1');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Twój komunikat 2');
END;
/

-- przyk?ad 3
DECLARE
    v_emp_id employees.employee_id%TYPE;
    v_liczba NUMBER := 0;
BEGIN
    v_liczba := 1;
    SELECT employee_id
      INTO v_emp_id
      FROM employees
     WHERE last_name = 'XXX'
    ;
    v_liczba := 2;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('v_liczba: '||v_liczba);
END;
/
