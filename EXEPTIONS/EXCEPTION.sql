
SET SERVEROUTPUT ON;

-- deklaracja
DECLARE
    ex_test EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_test, -2000);
BEGIN
    NULL;
END;
/

-- znajdowanie kodu ora
DECLARE
    ex_null_constr EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_null_constr, -01400);
BEGIN
    INSERT INTO COUNTRIES(country_name, region_id) VALUES ('XYZ', 2);
EXCEPTION
    WHEN ex_null_constr THEN
        DBMS_OUTPUT.PUT_LINE('Brawo Ty');
END;
/

-- nadpisanie wyj?tku predefiniowanego
DECLARE
    ex_no_data EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_no_data, 100);
    v_liczba NUMBER;
BEGIN
    SELECT 1
      INTO v_liczba
      FROM DUAL
     WHERE 1<>1;
EXCEPTION
    WHEN ex_no_data THEN
        DBMS_OUTPUT.PUT_LINE('Brawo Ty');
END;
/
5_8.sql
Wyœwietlam 5_8.sql.