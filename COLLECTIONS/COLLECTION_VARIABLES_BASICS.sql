SET SERVEROUTPUT ON;

-- przyk³ad zmiennej rekordowej
DECLARE
    TYPE t_typ_rekordowy IS RECORD (pole1 NUMBER, pole2 DATE);
    v_zmienna_rekordowa t_typ_rekordowy;
BEGIN
    v_zmienna_rekordowa.pole1 := 5;
    v_zmienna_rekordowa.pole2 := SYSDATE;
    
    DBMS_OUTPUT.PUT_LINE('v_zmienna_rekordowa.pole1: '||v_zmienna_rekordowa.pole1||chr(10)||
						 'v_zmienna_rekordowa.pole2:'||v_zmienna_rekordowa.pole2
						 );
END;
/

-- przyk³ad kolekcji
DECLARE
    TYPE t_typ_kolekcji IS TABLE OF VARCHAR2(40) INDEX BY BINARY_INTEGER;
    v_kolekcja t_typ_kolekcji;
BEGIN
    SELECT last_name
      BULK COLLECT INTO v_kolekcja
      FROM employees
     WHERE employee_id IN (100, 110, 120)
    ;
    
    FOR i IN 1..v_kolekcja.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_kolekcja(i));
    END LOOP;
END;
/
